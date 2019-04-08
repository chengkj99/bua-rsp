package price

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)

// GetPriceById 根据产品 Id 查询价格
func GetPriceById(c echo.Context) error {
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))
	price := &Price{Id: int64(id)}
	has, err := engine.Get(price)
	common.CheckErr(err)
	if has {
		return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: price})
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: nil})
}
