package rice

import (
	"fmt"
	"time"

	"github.com/labstack/echo"
	mw "github.com/labstack/echo/middleware"
	"github.com/tylerb/graceful"

	"github.com/holys/rice/config"
	"github.com/holys/rice/controller"
)

type Server struct {
	httpAddr string
	web      *echo.Echo
}

func NewServer(cfg *config.Config) *Server {
	s := new(Server)
	s.httpAddr = cfg.HttpAddr
	s.web = echo.New()
	return s
}

func (s *Server) registerGlobalMiddlewares() {
	s.web.Use(mw.Logger())
	s.web.Use(mw.Logger())
}

func (s *Server) Run() {
	s.registerGlobalMiddlewares()
	controller.RegisterURLs(s.web)
	fmt.Printf("runing on %s\n", s.httpAddr)
	graceful.ListenAndServe(s.web.Server(s.httpAddr), 5*time.Second)
}
