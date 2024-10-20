import requests as r

def cotacao_btc():
    url = 'https://economia.awesomeapi.com.br/last/BTC-BRL'
    response = r.get(url).json()
    cotacao = response['BTCBRL']['bid']
    return cotacao

if __name__ == '__main__':
    cotacao = cotacao_btc()
    print(f'1 BTC = R${float(cotacao):,.2f}')
