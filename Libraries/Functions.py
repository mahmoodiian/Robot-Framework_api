from jdatetime import datetime


def convert_to_jdatetime(strdatetime, pattern='%Y-%m-%dT%H:%M:%S.%fZ'):
    return datetime.fromgregorian(date=datetime.strptime(strdatetime, pattern)).strftime(pattern)
