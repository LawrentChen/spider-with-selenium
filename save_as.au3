; au3脚本使用分号注释
; 下面的定位信息可以通过 Autoit 自带的 Finder Tool 来探查

; 等待直至下载 os 窗口出现（一般 class 固定为 #32770），这里设置了 5 秒超时
WinWait("[CLASS:#32770]", "", 5);

; 输入光标定位到下载文件名文本框内，参数分别是探查到的 Title 和 Class + Instance。 使用 $CmdLine[1] 可以在调用时从外部传入参数
ControlFocus("另存为", "", $CmdLine[1]); 

; $CmdLine[0] 获取的是命令行参数的总数，在上例中$CmdLine[0]=3
; $CmdLine[1]~$CmdLine[63] 获取的是命令行参数第1到第63位，这个方式最多只能获取63个参数，不过正常情况下是足够用的
; $CmdLineRaw 获取的是未拆分的所有参数，是一个长字符串，这种情况下不局限与63个参数

; 输入准备保存的路径和文件名
ControlSetText("另存为", "", "Edit1", "filepath");

; 阻塞，注意单位是毫秒
Sleep(1000)

; 点击保存按钮
ControlClick("另存为", "", "Button2");

Sleep(500)

; 覆盖旧文件，但这样第一次就要先生成一个同名的空文件
ControlClick("是", "", "Button1")

; 最后将此代码文件 compile 成 exe 即可调用