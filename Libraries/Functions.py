from jdatetime import datetime

def get_email(string):
    data_list = string.split(',')
    data_list[1] = data_list[1].split('email=')[1]
    return data_list


def convert_to_jdatetime(strdatetime, pattern='%Y-%m-%dT%H:%M:%S.%fZ'):
    return datetime.fromgregorian(date=datetime.strptime(strdatetime, pattern)).strftime(pattern)
