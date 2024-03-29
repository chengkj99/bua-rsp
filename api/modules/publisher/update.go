package publisher

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"strconv"

	"github.com/labstack/echo"
)

// Publisher 更新用户信息
func UpdatePublisher(c echo.Context) error {
	var publisher Publisher
	engine := db.Engine

	// 获取数据
	c.Bind(&publisher)
	// 获取需要被修改的 id
	id, _ := strconv.Atoi(c.Param("id"))

	// 需要 id 为主键时才可用，id 为主键，仅需将类型设置为 int64
	affected, err := engine.Id(id).Update(publisher)

	// affected, err := engine.Update(&product, &Product{Id: id})

	common.CheckErr(err)
	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: affected})
}
