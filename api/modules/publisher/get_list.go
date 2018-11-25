package publisher

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)

func GetPublishers(c echo.Context) error {
	engine := db.Engine
	var publishers Publishers
	engine.Sql("SELECT * FROM publisher").Find(&publishers.Data)

	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    publishers.Data,
	}

	return c.JSON(http.StatusOK, res)
}

// GetPublisherByID 根据 Id 查询
func GetPublisherByID(c echo.Context) error {
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))
	publisher := &Publisher{Id: int64(id)}
	has, err := engine.Get(publisher)
	common.CheckErr(err)
	if has {
		return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: publisher})
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: nil})
}

// GetPublisherByCookie 根据 cookie 查询
func GetPublisherByCookie(c echo.Context) error {
	engine := db.Engine
	cookie, err := c.Cookie("uid")
	uid, err := strconv.ParseInt(cookie.Value, 10, 64)
	common.CheckErr(err)
	publisher := &Publisher{Id: uid}
	has, err := engine.Get(publisher)
	common.CheckErr(err)
	if has {
		return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: publisher})
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: nil})
}
