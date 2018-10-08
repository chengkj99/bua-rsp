package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)

// GetList for route of getList
func GetList(c echo.Context) error {
	engine := db.Engine
	var products Products

	query := c.Request().FormValue("query")

	if query == "" {
		// 全量查询
		engine.Sql("SELECT * FROM product").Find(&products.Data)
	} else {
		//  根据查询条件查询列表
		engine.Sql("SELECT * FROM product WHERE name LIKE '%" + query + "%'").Find(&products.Data)
		// 为什么要加单引号包起来 %query% 呢 ？
	}

	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    products.Data,
	}
	return c.JSON(http.StatusOK, res)
}

// GetListByID 根据 产品 ID 查询
func GetListByID(c echo.Context) error {
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))
	product := &Product{Id: int64(id)}
	has, err := engine.Get(product)
	common.CheckErr(err)
	if has {
		return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: product})
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: nil})
}

// GetListByUID 根据 产品 ID 查询
func GetListByUID(c echo.Context) error {
	engine := db.Engine
	var products Products
	uid, _ := strconv.Atoi(c.Param("uid"))
	engine.Sql("SELECT * FROM product WHERE uid = ?", uid).Find(&products.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    products.Data,
	}
	return c.JSON(http.StatusOK, res)
}

// func GetList(c echo.Context) error {
// db := db.Db
// 	rows, err := db.Query("SELECT * FROM product")
// 	common.CheckErr(err)
// 	// 读出查询出的列字段名
// 	cols, _ := rows.Columns()
// 	// values是每个列的值，这里获取到 byte 里
// 	values := make([][]byte, len(cols))
// 	// query.Scan 的参数，因为每次查询出来的列是不定长的，用 len(cols) 定住当次查询的长度
// 	scans := make([]interface{}, len(cols))
// 	// 让每一行数据都填充到 [][]byte 里面
// 	for i := range values {
// 		scans[i] = &values[i]
// 	}

// 	// 最后得到的map
// 	var results []map[string]string
// 	i := 0
// 	// 循环，让游标往下推
// 	for rows.Next() {
// 		// query.Scan查询出来的不定长值放到scans[i] = &values[i],也就是每行都放在values里
// 		err := rows.Scan(scans...)
// 		common.CheckErr(err)

// 		// 每行数据
// 		row := make(map[string]string)

// 		// 每行数据是放在values里面，现在把它挪到row里
// 		for k, v := range values {
// 			key := cols[k]
// 			row[key] = string(v)
// 		}
// 		// 装入结果集中
// 		results = append(results, row)
// 		i++
// 	}

// 	// 查询出来的数组
// 	// for k, v := range results {
// 	// 	fmt.Println(k, v)
// 	// }

// 	return c.JSON(http.StatusOK, results)
// }
