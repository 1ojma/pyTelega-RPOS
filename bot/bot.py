import pymysql as pms
import telebot
import constants
from telebot import types


bot = telebot.TeleBot(constants.token)

req_dict ={}
class Req:
    def __init__(self,idType):
        self.idType = idType
        self.idCompany = None
        self.idPC = None
        self.DevName = None
        self.Count = None

@bot.message_handler(commands=['start'])
def handle_start(message):
    text = 'Привет! Данный бот поможет Вам просмотреть или же добавить комплектуюшее на наш склад. Для более подобной информации введите /help'
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton('/show')
    item2 = types.KeyboardButton('/add')
    item3 = types.KeyboardButton('/help')
    markup.add(item1,item2,item3)
    bot.send_message(message.chat.id,text, reply_markup =markup)

@bot.message_handler(commands=['help'])
def handle_help(message):
    text = 'Доступные на данный момент команды:' '\n' '/show - просмотреть информацию о комлплектующих на складе;' '\n' '/add - добавить комплектующее на склад.'
    bot.send_message(message.chat.id,text)


@bot.message_handler(commands=["show"])
def repeat_all_messages(message):
    db = pms.connect("localhost", "root", "", "pcmf", charset='utf8')
    c = db.cursor()
    text = ''
    sql = 'SELECT idDevice,TypeName, CompanyName, DevName, PCtype, Count FROM warehouse INNER JOIN detailtypes USING (idType) INNER JOIN company USING (idCompany) INNER JOIN manufacture using (idPC) ORDER BY idDevice'
    c.execute(sql)
    res = c.fetchall()
    for r in res:
        text += str(r) +'\n\n'
    bot.send_message(message.chat.id,text)
    db.close()

@bot.message_handler(commands=['add'])
def handle_add(message):

     mk = types.ReplyKeyboardMarkup(row_width = 2)
     item1 = types.KeyboardButton('1')
     item2 = types.KeyboardButton('2')
     item3 = types.KeyboardButton('3')
     item4 = types.KeyboardButton('4')
     item5 = types.KeyboardButton('5')
     item6 = types.KeyboardButton('6')
     item7 = types.KeyboardButton('7')
     mk.add(item1,item2,item3,item4,item5,item6,item7)
     msg = bot.reply_to(message,'Введите idType:', reply_markup = mk)
     bot.register_next_step_handler(msg, process_idtype_step)

def process_idtype_step(message):
    try:
        idType = message.text
        req = Req(idType)
        req_dict[message.chat.id] = req

        mk = types.ReplyKeyboardMarkup(row_width = 2)
        item1 = types.KeyboardButton('1')
        item2 = types.KeyboardButton('2')
        item3 = types.KeyboardButton('3')
        item4 = types.KeyboardButton('4')
        item5 = types.KeyboardButton('5')
        item6 = types.KeyboardButton('6')
        item7 = types.KeyboardButton('7')
        item8 = types.KeyboardButton('8')
        item9 = types.KeyboardButton('9')
        item10 = types.KeyboardButton('10')
        mk.add(item1,item2,item3,item4,item5,item6,item7,item8,item9,item10)

        msg = bot.reply_to(message,'Введите idCompany:', reply_markup = mk)
        print(message.text)
        bot.register_next_step_handler(msg, process_idcompany_step)
    except Exception as e:

        bot.reply_to(message,e)

def process_idcompany_step(message):
    try:
        idCompany = message.text
        req = req_dict[message.chat.id]
        req.idCompany = idCompany

        mk = types.ReplyKeyboardMarkup(row_width = 2)
        item1 = types.KeyboardButton('1')
        item2 = types.KeyboardButton('2')
        item3 = types.KeyboardButton('3')
        item4 = types.KeyboardButton('4')
        mk.add(item1,item2,item3,item4)

        msg = bot.reply_to(message,'Введите idPC:', reply_markup =mk)
        bot.register_next_step_handler(msg, process_idpc_step)
    except Exception as e:
        print(e)
        bot.reply_to(message,e)

def process_idpc_step(message):
    try:
        idPC = message.text
        req = req_dict[message.chat.id]
        req.idPC = idPC
        msg = bot.reply_to(message,'Введите название:', reply_markup = types.ReplyKeyboardRemove())
        bot.register_next_step_handler(msg, process_devname_step)
    except Exception as e:
        bot.reply_to(message,e)


def process_devname_step(message):
    try:
        DevName = message.text
        req = req_dict[message.chat.id]
        req.DevName = DevName
        msg = bot.reply_to(message,'Введите количество на складе:')
        bot.register_next_step_handler(msg, process_count_step)
    except Exception as e:
        bot.reply_to(message,e)

def process_count_step(message):
    try:
        db = pms.connect("localhost", "root", "", "pcmf", charset='utf8')
        c = db.cursor()
        Count = message.text
        req = req_dict[message.chat.id]
        req.Count = Count
        markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
        item1 = types.KeyboardButton('/show')
        item2 = types.KeyboardButton('/add')
        item3 = types.KeyboardButton('/help')
        markup.add(item1,item2,item3)
        bot.send_message(message.chat.id,'Операция завершена успешно', reply_markup = markup)
        sql = "INSERT INTO warehouse (idType, idCompany, idPC, DevName, Count) VALUES ('%s', '%s', '%s', '%s', '%s')"%(req.idType, req.idCompany, req.idPC, req.DevName, req.Count)
        c.execute(sql)
        db.commit()
        db.close()
    except Exception as e:
        bot.reply_to(message,e)

if __name__ == '__main__':
    bot.polling(none_stop=True)


