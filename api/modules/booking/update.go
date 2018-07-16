package booking

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"strconv"

	"github.com/labstack/echo"
)

// update 更新预约信息
func Update(c echo.Context) error {
	var booking Booking
	engine := db.Engine

	// 获取数据
	c.Bind(&booking)
	// 获取需要修改的 id
	id, _ := strconv.Atoi(c.Param("id"))

	// 需要 id 为主键时才可用，id 为主键，仅需将类型设置为 int64
	affected, err := engine.Id(id).Update(booking)

	common.CheckErr(err)

	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: affected})
}
