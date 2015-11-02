package controller

import (
	"github.com/holys/rice/controller/user"
	"github.com/labstack/echo"
)

func RegisterURLs(r *echo.Echo) {
	user.RegisterHandlers(r)
}
