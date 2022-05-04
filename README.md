Программа Expand_Array.tcl принимает массив координат точек в декартовой системе координат, состоящий минимум из 2 столбцов, которые представляют из cебя координаты точек по осям X и Y. Программа при выборе соответствующей настройке может поменять разделитель колонок или добавить массив точек на указанный угол вдоль оси Z. Разделителем целой и дробной частей числа должна быть точка. Файл не должен содержать шапки или предисловия.

Инструкция по работе с программой:
1) В блоке Input File Path нажмите на кнопку Open File и выберите файл содержащий массив координат точек в декартовой системе координат.
2) В блоке Delimiter Type Input выберите разделитель столбцов.
3) В блоке Delimiter Type Output выберите желаемый разделитель столбцов выходного файла.
4) В блоке Type Copy выберите Just change separator если хотите только поменять разделитель столбцов. 
5) При выборе в блоке Type Copy пункт One side или Two side необходимо в блоке Angle of rotation указать угол, на который вы хотите копировать массив, в блоке Column X и Column Y указать столбцы, которые будут выступать за координаты X и Y.

При выборе One side массив копируется в направлении знака указанного угла в строке Angle of rotation (правило правой руки).
При выборе Two side массив копируется в обоих направлениях от исходного положения массива на угол указанный в строке Angle of rotation.

Пример массива, на котором можно опробовать программу расположен в папке Description под названием Test_massiv.csv

Программа написана на языке программирования Tcl/Tk.
Для работы программы необходимо установленный Tcl, скачанный например с сайта https://www.activestate.com/products/tcl/