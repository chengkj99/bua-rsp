const express = require('express');
const app = express();
const fs = require('fs')

const AlipaySdk = require('alipay-sdk').default;

const AlipayFormData = require('alipay-sdk/lib/form').default;

const config = {
  appId: '2019103168779334',
  publicKey: fs.readFileSync('./public-key.pem', 'ascii'), //应用公钥

  sandboxAppId: '2016101600696108',
  privateKey: fs.readFileSync('./private-key.pem', 'ascii'), //商户私钥
  alipayPublicKey: fs.readFileSync('./ali_public-key.pem', 'ascii'), //支付宝公钥
  gateway: 'https://openapi.alipaydev.com/gateway.do'
}

const aliPayOptins = {
  gateway: config.gateway,
  appId: config.sandboxAppId, //支付宝的appId
  privateKey: config.privateKey, //商户私钥
  alipayPublicKey: config.alipayPublicKey //支付宝公钥
}

app.get('/', function (req, res) {
  console.log('Hello Pay-ex')
  res.send('Hello Pay-ex!');
});

app.post('/notify*', function (req, res) {
  console.log('Post Pay Success')
  res.send('Post Pay Success!');
});

app.get('/alipay', async function (req, res) {
  const productId = req.param('productId')
  const bookingId = req.param('bookingId')
  const alipaySdk = new AlipaySdk({
    ...aliPayOptins
  });

  const formData = new AlipayFormData();

  formData.setMethod('get');
  formData.addField('returnUrl', 'http://localhost:8086/#/user-booking');
  // formData.addField('notifyUrl', 'http://192.168.43.180:1326/notify'); // 通知后端的url
  formData.addField('bizContent', {
    outTradeNo: `${productId}/${bookingId}`,
    productCode: 'FAST_INSTANT_TRADE_PAY',
    totalAmount: '0.1', // TODO
    subject: '商品', // TODO
    body: '商品详情', // TODO
  });

  const result = await alipaySdk.exec(
    'alipay.trade.page.pay', {}, {
      formData: formData
    },
  );

  // result 为可以跳转到支付链接的 url
  console.log(result);
  res.json({
    data: result
  });
});

app.listen(1326, '0.0.0.0', function () {
  console.log('Pay-ex app listening on port 1326!');
});
