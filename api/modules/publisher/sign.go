package publisher

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"fmt"
	"net/http"
	"strconv"
	"time"

	"github.com/labstack/echo"
)

func writeCookie(c echo.Context) error {
	cookie := new(http.Cookie)
	cookie.Name = "username"
	cookie.Value = "jon"
	cookie.Expires = time.Now().Add(24 * time.Hour)
	c.SetCookie(cookie)
	return c.String(http.StatusOK, "write a cookie")
}

// 登录 login
func SignIn(c echo.Context) error {
	var publisher Publisher
	var databasePublisher Publisher

	c.Bind(&publisher)
	engine := db.Engine
	engine.Where("name = ?", publisher.Name).Get(&databasePublisher)

	fmt.Println("publisher&&&", publisher)
	fmt.Println("databasePublisher&&&", databasePublisher)

	if publisher.Name == "" || publisher.Password == "" {
		return c.JSON(http.StatusOK, common.Response{Code: 403, Message: "登录失败", Data: nil})
	}

	if publisher.Password != databasePublisher.Password {
		return c.JSON(403, common.Response{Code: 403, Message: "密码不正确", Data: nil})
	}

	cookieForUID := common.GetCookie("uid", strconv.FormatInt(databasePublisher.Id, 10))
	cookieForUtype := common.GetCookie("utype", "publisher")
	c.SetCookie(cookieForUID)
	c.SetCookie(cookieForUtype)

	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: databasePublisher})
}
