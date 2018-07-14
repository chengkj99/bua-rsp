# API

- [查询产品列表](#查询产品列表)
- [根据产品ID查询产品](#根据产品ID查询产品)
- [添加产品](#添加产品)
- [更改产品状态](#更改产品状态)
- [删除产品](#删除产品)
- [查询预约列表](#查询预约列表)
- [新增产品预约](#新增产品预约)

### 查询产品列表

#### URL

> [/product/list?query=全自动](/product/list)

#### HTTP请求方式

> GET

#### 请求参数
|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| query | false | string | 根据产品名称查询参数 |

#### 接口示例

> 地址：[http://127.0.0.1:1323/product/list](http://127.0.0.1:1323/product/list)

```
{
  "code": 200,
  "message": "OK"
  "data": [
    {
      "id": 90,
      "name": "全自动纤维分析仪",
      "original_price": "12.5万元",
      "firm_model": "美国ANKOM",
      "parameter": "一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟",
      "functional_use": "检测ADF、NDF、ADL等含量",
      "desc": "ADD90",
      "contacts": "王宗义",
      "phone": "13651226099",
      "mail": "Wangzongyi001@sina.com",
      "imgUrl": "empty url",
      "owner": "Wangzongyi77",
      "status": "disable"
    },
    ...
  ]
}
```

### 根据产品ID查询产品

#### URL

> [/product/list/:id](/product/list/:id)

#### HTTP请求方式

> GET

#### 请求参数

|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| id | ture | int | 产品ID |

#### 接口示例

> 地址：[http://127.0.0.1:1323/product/list/93](http://127.0.0.1:1323/product/list/93)

```
{
  "code": 200,
  "message": "ok",
  "data": {
    "id": 90,
    "name": "全自动纤维分析仪",
    "original_price": "12.5万元",
    "firm_model": "美国ANKOM",
    "parameter": "一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟",
    "functional_use": "检测ADF、NDF、ADL等含量",
    "desc": "ADD90",
    "contacts": "王宗义",
    "phone": "13651226099",
    "mail": "Wangzongyi001@sina.com",
    "imgUrl": "empty url",
    "owner": "Wangzongyi777",
    "status": "disable"
  }
}
```

### 添加产品

#### URL

> [/product/add](/product/add)

#### HTTP请求方式

> POST

#### 请求参数

|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| name | true | string | 产品名 |
| original_price | true | string | 原值（万元） |
| firm_model | true | string | 厂商型号 |
| parameter | true | string | 性能参数 |
| functional_use | true | string | 功能用途 |
| desc | string | false | 描述 |
| contacts | true | string | 联系人 |
| phone | false | string | 联系人电话 |
| mail | true | string | 联系人邮箱 |
| imgUrl | false | string | 图片地址 |
| owner | true | string | 产品所属 |
| status | false | string | 产品借用状态 |

#### 请求示例

requestBody

```
{
  "name": "全自动纤维分析仪",
  "original_price": "12.5万元",
  "firm_model": "美国ANKOM",
  "parameter": "一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟",
  "functional_use": "检测ADF、NDF、ADL等含量",
  "desc": "ADD90",
  "contacts": "王宗义",
  "phone": "13651226099",
  "mail": "Wangzongyi001@sina.com",
  "imgUrl": "empty url",
  "owner": "Wangzongyi",
  "status": "disable"
}
```

#### 接口示例

> 地址：[http://127.0.0.1:1323/product/add](http://127.0.0.1:1323/product/add)

```
{
  "data": 1,
  "code": 200,
  "message": "ok"
}
```

### 更改产品状态

#### URL

> [product/status/:id](product/status/156)

#### HTTP 请求方式

> PUT

#### 请求参数

|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| status | true | string | 可选状态。enable: 可用； disable: 不可用。 |

#### 请求示例

```
{
	"status": "enable"
}
```

#### 接口示例

> 地址 [http://127.0.0.1:1323/product/status/156](http://127.0.0.1:1323/product/status/156)

```
{
  "data": 0,
  "code": 200,
  "message": "ok"
}
```

### 删除产品

#### URL

> [/product/:id](/product/:id)

#### HTTP 请求方式

> DELETE

#### 请求参数

|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| id | ture | int | 产品ID |

#### 接口示例
> 地址 [http://127.0.0.1:1323/product/90](http://127.0.0.1:1323/product/90)

```
{
  "data": 1,
  "code": 200,
  "message": "ok"
}
```

### 查询预约列表

#### URL

> [/booking/list](/booking/list)

#### HTTP请求方式

> GET

#### 请求参数

无

#### 接口示例

> 地址：[http://127.0.0.1:1323/booking/list](http://127.0.0.1:1323/booking/list)

```
{
  "data": [
      {
          "id": 5,
          "product_id": 99,
          "booking_man": "chengkangjian",
          "start_time": "2018-6-25 10:10:10",
          "end_time": "2018-6-29 11:11:11"
      },
      {
          "id": 6,
          "product_id": 90,
          "booking_man": "zhangsan",
          "start_time": "2018-6-24 10:10:11",
          "end_time": "2018-7-1 11:11:12"
      }
  ],
  "code": 200,
  "message": "OK"
}
```

### 新增产品预约

#### HTTP请求方式

> POST

#### 请求参数

|参数|必选|类型|说明|
|:----- |:-------|:-----|----- |
| product_id | ture | int | 产品ID |
| booking_man | ture | string | 预定人 |
| start_time | ture | string | 开始时间 |
| end_time | ture | string | 结束时间 |

#### 请求示例

```
{
	"booking_man": "zhangsan",
	"product_id": 90,
	"start_time": "2018-6-24 10:10:11",
	"end_time": "2018-7-1 11:11:12"
}
```

#### 接口示例

> 地址：[http://127.0.0.1:1323/booking/add](http://127.0.0.1:1323/booking/add)

```
{
  "data": 1,
  "code": 200,
  "message": "ok"
}
```


## 字段

#### 1. 产品信息

|返回字段|字段类型|说明 |
|:----- |:------|:----------------------------- |
| id | int | —— |
| name | string | 产品名 |
| original_price | string | 原值（万元） |
| firm_model | string | 厂商型号 |
| parameter | string | 性能参数 |
| functional_use | string | 功能用途 |
| desc | string | 描述 |
| contacts | string | 联系人 |
| phone | string | 联系人电话 |
| mail | string | 联系人邮箱 |
| imgUrl | string | 图片地址 |
| owner | string | 产品所属 |
| status | string | 产品借用状态 |

#### 2. 预约信息

|返回字段|字段类型|说明 |
|:----- |:------|:----------------------------- |
| id | int | - |
| product_id | int | - |
| booking_man | string | 预定人 |
| start_time | string | 开始时间 |
| end_time | string | 结束时间 |
