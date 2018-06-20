package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"strconv"

	"github.com/labstack/echo"
)

// Update 更新产品信息
func Update(c echo.Context) error {
	var product Product
	engine := db.Engine

	// 获取数据
	c.Bind(&product)
	// 获取需要被修改的 id
	id, _ := strconv.Atoi(c.Param("id"))

	// 需要 id 为主键时才可用，id 为主键，仅需将类型设置为 int64
	affected, err := engine.Id(id).Update(product)

	// affected, err := engine.Update(&product, &Product{Id: id})

	common.CheckErr(err)
	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: affected})
}
