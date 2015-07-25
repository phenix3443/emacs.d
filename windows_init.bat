rem添加第三方工具路径到path环境变量
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%APPDATA%\.emacs.d\win_apps\;%APPDATA%\win_apps\glo65wb\bin"
rem 添加gnu global使用的环境变量
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%APPDATA%\.emacs.d\win_apps\glo65wb\share\gtags\gtags.conf"
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygment"
rem 解压GNU Global
unzip -o glo65wb.zip


echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
