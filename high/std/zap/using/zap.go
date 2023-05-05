package main

import (
	"errors"
	"os"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var logger *zap.Logger
var sugarLogger *zap.SugaredLogger

func InitLogger() {
	encoder := getEncoder()
	writerSyncer := getLogWriter()
	core := zapcore.NewCore(encoder, writerSyncer, zapcore.DebugLevel)
	logger = zap.New(core)
	sugarLogger = logger.Sugar()
}

func getEncoder() zapcore.Encoder {
	encoderConfig := zap.NewProductionEncoderConfig()
	encoderConfig.EncodeTime = zapcore.ISO8601TimeEncoder
	encoderConfig.EncodeLevel = zapcore.CapitalLevelEncoder
	return zapcore.NewConsoleEncoder(encoderConfig)
}

func getLogWriter() zapcore.WriteSyncer {
	file, _ := os.Create("./test.log")
	return zapcore.AddSync(file)
}

func main() {
	InitLogger()
	defer logger.Sync()

	logger.Info("测试111", zap.String("键1", "值1"), zap.String("键2", "值2"))
	logger.Error("无法读取目录%s", zap.Error(errors.New("/etc/sssssssss")), zap.String("err", "错误输出"))
	sugarLogger.Infof("无法读取目录%s", "/etc/sssssssss")
}
