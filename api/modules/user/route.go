package user

import (
	"github.com/labstack/echo"
)

// Route 用户管理路由
// 前缀 /user
func Route(rg *echo.Group) {
	// 获取用户列表
	rg.GET("/list", GetUsers)
	// 根据 ID 获取用户信息
	rg.GET("/list/:id", GetUserByID)

	// 创建用户
	rg.POST("/add", Create)

	// 删除用户
	rg.DELETE("/:id", Delete)

	// 修改用户信息
	rg.PUT("/:id", UpdateUser)

	// 登录
	rg.POST("/login", SignIn)
}
