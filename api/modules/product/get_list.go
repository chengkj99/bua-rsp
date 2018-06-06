package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// 目前是在未知结构体的情况下进行读取，如何在已知结构体下的进行 mysql 查询待研究
// type ProductInfo struct {
// 	ID            int    `json:"id"`
// 	Name          string `json:"name"`
// 	OriginalPrice string `json:"original_price"`
// 	FirmModel     string `json:"firm_model"`
// 	Parameter     string `json:"parameter"`
// 	FunctionalUse string `json:"functional_use"`
// 	Desc          string `json:"desc"`
// 	Contacts      string `json:"contacts"`
// 	Phone         string `json:"phone"`
// 	Mail          string `json:"mail"`
// }
// type Products struct {
// 	Products []ProductInfo `json:"ProductInfo"`
// }

// GetList for route of getList
func GetList(c echo.Context) error {
	db := db.Db
	rows, err := db.Query("SELECT * FROM product")
	common.CheckErr(err)

	// 读出查询出的列字段名
	cols, _ := rows.Columns()
	// values是每个列的值，这里获取到 byte 里
	values := make([][]byte, len(cols))
	// query.Scan 的参数，因为每次查询出来的列是不定长的，用 len(cols) 定住当次查询的长度
	scans := make([]interface{}, len(cols))
	// 让每一行数据都填充到 [][]byte 里面
	for i := range values {
		scans[i] = &values[i]
	}

	// 最后得到的map
	var results []map[string]string
	i := 0
	// 循环，让游标往下推
	for rows.Next() {
		// query.Scan查询出来的不定长值放到scans[i] = &values[i],也就是每行都放在values里
		err := rows.Scan(scans...)
		common.CheckErr(err)

		// 每行数据
		row := make(map[string]string)

		// 每行数据是放在values里面，现在把它挪到row里
		for k, v := range values {
			key := cols[k]
			row[key] = string(v)
		}
		// 装入结果集中
		results = append(results, row)
		i++
	}

	// 查询出来的数组
	// for k, v := range results {
	// 	fmt.Println(k, v)
	// }

	return c.JSON(http.StatusOK, results)
}
