import requests as r

def cotacao_dolar():
    url = 'https://economia.awesomeapi.com.br/last/USD-BRL'
    response = r.get(url).json()
    cotacao = response['USDBRL']['bid']
    return cotacao

if __name__ == '__main__':
    cotacao = cotacao_dolar()
    print(f'$ 1,00 = 💵 R${float(cotacao):.2f}')
