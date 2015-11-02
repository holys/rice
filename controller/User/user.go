package user

import "github.com/labstack/echo"

func RegisterHandlers(r *echo.Echo) {
	h := &UserHandler{}
	r.Get("/", h.Hello)
}

type UserHandler struct{}

func (h *UserHandler) Hello(ctx *echo.Context) error {
	return ctx.String(200, "hello, world")
}
