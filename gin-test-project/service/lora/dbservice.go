package lora

import (
	"test/gin-test-project/model"
	"test/gin-test-project/utils"
)

type LoraService struct {
}

func (*LoraService) Create(lorastruct model.LoraStruct) (err error) {
	err = utils.PROJ_DB.DB.Create(&lorastruct).Error
	return
}

func (*LoraService) Delete(ids model.IdsReq) (err error) {
	err = utils.PROJ_DB.DB.Delete(&[]model.LoraStruct{}, "id in ?", ids.Ids).Error
	return err
}

func (*LoraService) Update(id uint, lorastruct model.LoraStruct) (err error) {
	err = utils.PROJ_DB.DB.Where("id = ?", id).Save(&lorastruct).Error
	return err
}

func (*LoraService) Get(id uint) (lorastruct model.LoraStruct, err error) {
	err = utils.PROJ_DB.DB.Where("id = ?", id).First(&lorastruct).Error
	return
}
