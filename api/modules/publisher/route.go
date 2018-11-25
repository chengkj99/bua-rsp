package publisher

import (
	"github.com/labstack/echo"
)

// Route 用户管理路由
// 前缀 /publisher
func Route(rg *echo.Group) {
	// 获取用户列表
	rg.GET("/list", GetPublishers)
	// 根据 ID 获取用户信息
	rg.GET("/list/:id", GetPublisherByID)
	// 根据 ID 获取用户信息
	rg.GET("/overview", GetPublisherByCookie)

	// 创建用户
	rg.POST("/add", Create)

	// 删除用户
	rg.DELETE("/:id", Delete)

	// 修改用户信息
	rg.PUT("/:id", UpdatePublisher)

	// 登录
	rg.POST("/login", SignIn)

	// 登出
	// rg.POST("/signout", SignOut)
}
