package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"strconv"

	"github.com/labstack/echo"
)

// UpdateStatus 修改产品可用性状态
func UpdateStatus(c echo.Context) error {
	var product Product
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))
	c.Bind(&product)

	affected, err := engine.Id(id).Cols("status").Update(product)
	common.CheckErr(err)
	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: affected})
}
