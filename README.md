## 本项目实现的最终作用是基于JSP在线水果超市商城
## 分为2个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 会员管理
 - 历史订单
 - 发布水果
 - 查看订单
 - 水果分类
 - 水果管理
 - 活动资讯管理
 - 留言管理
 - 管理员登录
 - 管理员管理
### 第2个角色为用户角色，实现了如下功能：
 - 加入购物车
 - 查看水果详细
 - 查看订单
 - 查看购物车
 - 生成订单
 - 用户首页
 - 留言板
## 数据库设计如下：
# 数据库设计文档

**数据库名：** shuiguo_shop

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [bmessage](#bmessage) |  |
| [bookcar](#bookcar) |  |
| [bookorder](#bookorder) |  |
| [buser](#buser) |  |
| [factorys](#factorys) |  |
| [mixinfo](#mixinfo) |  |
| [pinj](#pinj) |  |
| [pinlun](#pinlun) |  |
| [pros](#pros) |  |
| [protype](#protype) |  |

**表名：** <a id="bmessage">bmessage</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | author |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 作者  |
|  3   | content |   text   | 65535 |   0    |    Y     |  N   |   NULL    | 内容  |
|  4   | reback |   text   | 65535 |   0    |    Y     |  N   |   NULL    |   |
|  5   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="bookcar">bookcar</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | uname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | bookid |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | booknum |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="bookorder">bookorder</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | uid |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户ID  |
|  3   | bid |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | num |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 数量  |
|  5   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | state |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 状态  |
|  7   | shdz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | zffs |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | shfs |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | lxdh |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | yf |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  12   | totalnum |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="buser">buser</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | uname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | upass |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  4   | tname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 真实名字  |
|  5   | sex |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 性别  |
|  6   | age |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 年龄  |
|  7   | tel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  8   | addr |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  9   | email |   varchar   | 45 |   0    |    Y     |  N   |   NULL    | 邮箱  |
|  10   | QQ |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | QQ号码  |
|  11   | utype |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户类型  |
|  12   | state |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 状态  |
|  13   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="factorys">factorys</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | uname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | factoryname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | lxr |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 联系人  |
|  5   | lxtel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | addrs |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="mixinfo">mixinfo</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | title |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 标题  |
|  3   | filename |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 文件名  |
|  4   | content |   text   | 65535 |   0    |    Y     |  N   |   NULL    | 内容  |
|  5   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="pinj">pinj</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | saver |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 上传者  |
|  3   | pj |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  4   | proid |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="pinlun">pinlun</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | saver |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 上传者  |
|  3   | content |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 内容  |
|  4   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 保存时间  |
|  5   | proid |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="pros">pros</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | proname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | cpcj |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | cand |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | protype |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | mprice |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  7   | tgrs |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | discount |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | filename |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 文件名  |
|  10   | pcontent |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | status |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 状态  |
|  12   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | uname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |

**表名：** <a id="protype">protype</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | typename |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 类型名称  |
|  3   | savetime |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 保存时间  |

**运行不出来可以微信 javape 我的公众号：源码码头**
