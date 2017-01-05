@echo off
rem @chcp 65001
bin\cotoco.exe /nologo /Fo out\cotopha.co cotopha.cos
bin\cotoco.exe /nologo /Fo out\init.co init.cos
bin\cotoco.exe /nologo /Fo out\structs.co structs.cos
bin\cotoco.exe /nologo /Fo out\ConfigDataBase.co ConfigDataBase.cos
bin\cotoco.exe /nologo /Fo out\SystemObject.co SystemObject.cos
bin\cotoco.exe /nologo /Fo out\start_screens.co start_screens.cos
bin\cotoco.exe /nologo /Fo out\AdvScreen.co AdvScreen.cos
bin\cotoco.exe /nologo /Fo out\AppreciationView.co AppreciationView.cos
bin\cotoco.exe /nologo /Fo out\yosuga.co yosuga.cos
bin\cotoco.exe /nologo /Fo out\bgm.co bgm.cos
bin\cotoco.exe /nologo /Fo out\BustupManager.co BustupManager.cos
bin\cotoco.exe /nologo /Fo out\EyeCatch.co EyeCatch.cos
bin\cotoco.exe /nologo /Fo out\Debug.co Debug.cos
bin\cotoco.exe /nologo /Fo out\Input.co Input.cos
bin\cotoco.exe /nologo /Fo out\Flag.co Flag.cos
bin\cotoco.exe /nologo /Fo out\ConfigWindow.co ConfigWindow.cos
bin\cotoco.exe /nologo /Fo out\vars.co vars.cos
bin\cotoco.exe /nologo /Fo out\HistoryWindow.co HistoryWindow.cos
bin\cotoco.exe /nologo /Fo out\LogManager.co LogManager.cos
bin\cotoco.exe /nologo /Fo out\MessageFrame.co MessageFrame.cos
bin\cotoco.exe /nologo /Fo out\LoadSaveWindow.co LoadSaveWindow.cos
bin\cotolink.exe /nologo /Lo out\yosuga.csx out\cotopha.co out\init.co out\structs.co out\ConfigDataBase.co out\SystemObject.co out\start_screens.co out\yosuga.co out\AdvScreen.co out\AppreciationView.co out\bgm.co out\BustupManager.co out\EyeCatch.co out\Debug.co out\Input.co out\Flag.co out\ConfigWindow.co out\vars.co out\HistoryWindow.co out\LogManager.co out\MessageFrame.co out\LoadSaveWindow.co
bin\sora_tool.exe --export --input out/yosuga.csx --output ../data/
