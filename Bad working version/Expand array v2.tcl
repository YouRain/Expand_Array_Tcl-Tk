package require BWidget

wm title .
set width_monitor [winfo screenwidth .]
set height_monitor [winfo screenheight .]
wm geometry . [expr {int($width_monitor*03)}]x[expr {int($height_monitor*0.3)}]
update
set width_widget [winfo width .]
set height_widget [winfo height .]
wm geometry . +[expr {int(($width_monitor-$width_widget)*0.01)}]+[expr {int(($height_monitor-$height_widget)*0.01)}]
proc main_menu {} {
	global width_widget height_widget tl
	set tl [frame .toplevel]
	labelframe $tl.offset -text "Rotate (degree)" -labelanchor nw -font 14 -borderwidth 0 -relief groove
	labelframe $tl.columns_x -text "Column X" -labelanchor nw -font 14 -borderwidth 0 -relief groove
	labelframe $tl.columns_y -text "Column Y" -labelanchor nw -font 14 -borderwidth 0 -relief groove
	labelframe $tl.path_input -text "Input File Path" -labelanchor nw -font 14 -borderwidth 1 -relief groove
	labelframe $tl.delimiter_input -text "Delimiter Type Input" -labelanchor n -font 14 -borderwidth 1 -relief groove
	labelframe $tl.delimiter_output -text "Delimiter Type Output" -labelanchor n -font 14 -borderwidth 1 -relief groove
	labelframe $tl.copy_type -text "Type Copy" -labelanchor n -font 14 -borderwidth 1 -relief groove
	labelframe $tl.options -borderwidth 0 -relief groove
	entry $tl.offset.entry1 -textvariable offset_entry -font 14 -vcmd {fraction_digit %P $tl.offset.entry1} -validate all -bg white -state disabled
	entry $tl.path_input.entry2 -textvariable file_path -font 14 -validate all -bg white
	ComboBox $tl.columns_x.column_x -font 14 -state disabled
	ComboBox $tl.columns_y.column_y -font 14 -state disabled
	button $tl.path_input.open_button -text "Open File" -font 10 -bg white -command open_file
	radiobutton $tl.delimiter_input.rb2 -text "," -font 14 -variable delimiter_in -state disabled -value "," -command solve_column
	radiobutton $tl.delimiter_input.rb3 -text ";" -font 14 -variable delimiter_in -state disabled -value ";" -command solve_column
	radiobutton $tl.delimiter_input.rb4 -text "space" -font 14 -variable delimiter_in -state disabled -value " " -command solve_column
	radiobutton $tl.delimiter_output.rb2 -text "," -font 14 -variable delimiter_out -state disabled -value ","
	radiobutton $tl.delimiter_output.rb3 -text ";" -font 14 -variable delimiter_out -state disabled -value ";"
	radiobutton $tl.delimiter_output.rb4 -text "space" -font 14 -variable delimiter_out -state disabled -value " "
	radiobutton $tl.copy_type.rb0 -text "Just change separator" -font 14 -variable dark_side -state disabled -value "0"
	radiobutton $tl.copy_type.rb1 -text "One side" -font 14 -variable dark_side -state disabled -value "1"
	radiobutton $tl.copy_type.rb2 -text "Two side" -font 14 -variable dark_side -state disabled -value "2"
	button $tl.options.ok_button -text "Do It" -font 14 -bg white -command do_main
	button $tl.options.help_button -text "Help" -font 14 -bg white -command help_menu
	button $tl.options.exit_button -text "Exit" -font 14 -bg white -command exit

	grid columnconfigure . {0} -weight 1
	grid rowconfigure . {0} -weight 1
	grid columnconfigure $tl {0 1 2} -weight 1
	grid rowconfigure $tl {0 1 2} -weight 1
	grid $tl -column 0 -row 0 -columnspan 3 -rowspan 4 -sticky news
	grid $tl.offset -column 0 -row 0 -columnspan 2 -rowspan 1 -padx 5 -pady 15 -sticky ew
	grid $tl.columns_x -column 0 -row 1 -columnspan 1 -rowspan 1 -padx 5 -pady 15 -sticky ew
	grid $tl.columns_y -column 1 -row 1 -columnspan 1 -rowspan 1 -padx 5 -pady 15 -sticky ew
	grid $tl.path_input -column 0 -row 2 -columnspan 2 -rowspan 1 -padx 5 -pady 15 -sticky ew
	grid $tl.delimiter_input -column 2 -row 0 -columnspan 1 -rowspan 1 -padx 5 -pady 5 -sticky news
	grid $tl.delimiter_output -column 2 -row 1 -columnspan 1 -rowspan 1 -padx 5 -pady 5 -sticky news
	grid $tl.copy_type -column 2 -row 2 -columnspan 1 -rowspan 1 -padx 5 -pady 5 -sticky news
	grid $tl.options -column 0 -row 3 -columnspan 3 -rowspan 1 -padx 5 -pady 5 -sticky news
		
		grid columnconfigure $tl.offset {0} -weight 1
		grid rowconfigure $tl.offset {0} -weight 1
		grid $tl.offset.entry1 -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky news
		
		grid columnconfigure $tl.columns_x {0} -weight 1
		grid columnconfigure $tl.columns_y {0} -weight 1
		grid $tl.columns_x.column_x -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky ew
		grid $tl.columns_y.column_y -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky ew
		
		grid columnconfigure $tl.path_input {0} -weight 1
		grid $tl.path_input.entry2 -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky ew
		grid $tl.path_input.open_button -column 1 -row 0 -columnspan 1 -rowspan 1
	
		grid columnconfigure $tl.delimiter_input {0 1 2} -weight 1
		grid $tl.delimiter_input.rb2 -column 0 -row 0 -columnspan 1 -rowspan 1
		grid $tl.delimiter_input.rb3 -column 1 -row 0 -columnspan 1 -rowspan 1
		grid $tl.delimiter_input.rb4 -column 2 -row 0 -columnspan 1 -rowspan 1
		
		grid columnconfigure $tl.delimiter_output {0 1 2} -weight 1
		grid $tl.delimiter_output.rb2 -column 0 -row 0 -columnspan 1 -rowspan 1
		grid $tl.delimiter_output.rb3 -column 1 -row 0 -columnspan 1 -rowspan 1
		grid $tl.delimiter_output.rb4 -column 2 -row 0 -columnspan 1 -rowspan 1
		
		grid columnconfigure $tl.copy_type {0 1} -weight 1
		grid rowconfigure $tl.copy_type {0 1} -weight 1
		grid $tl.copy_type.rb0 -column 0 -row 1 -columnspan 2 -rowspan 1
		grid $tl.copy_type.rb1 -column 0 -row 0 -columnspan 1 -rowspan 1
		grid $tl.copy_type.rb2 -column 1 -row 0 -columnspan 1 -rowspan 1
		
		grid columnconfigure $tl.options {0 1 2} -weight 1
		grid $tl.options.ok_button -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky news
		grid $tl.options.help_button -column 1 -row 0 -columnspan 1 -rowspan 1 -sticky news
		grid $tl.options.exit_button -column 2 -row 0 -columnspan 1 -rowspan 1 -sticky news
		
	bind . <Return> "$tl.options.ok_button invoke"
	bind . <Escape> "$tl.options.exit_button invoke"
}
main_menu
wm deiconify .
proc do_main {} {
	global file_dir dir file_name delimiter_in delimiter_out name_new_file dark_side file_path
	if {[catch {set original_file [open $file_dir r]} errmsg] || $file_path == ""} {
		tk_messageBox -icon error -title "Error"\
		-message "Select File"\
		-type ok
		return 0
	}
	set original_file [open $file_dir r]
	set name_new_file ""
	append name_new_file $dir "/" $file_name "_Expand" ".csv"
	set new_file [open $name_new_file w]
	set content [read $original_file]
	set content [string map {" " ""} $content]
	set separator [list "$delimiter_in" "$delimiter_out"]
	set content [string map $separator $content]
	puts $new_file $content
	close $original_file
	close $new_file
	if {$dark_side ==1} {
		plus_angle "+"
	} elseif {$dark_side == 2} {
		plus_angle "+"
		plus_angle "-"
	}
}
proc plus_angle {znak} {
	global file_dir dir file_name delimiter_in delimiter_out name_new_file offset_entry exist_columns tl file_path number_column
	set original_file [open $file_dir r]
	set new_file [open $name_new_file a]
	if {$offset_entry == ""} {
		set offset_entry 0
	}
	set delta [expr double([change_type_number $offset_entry])]
	set pi [expr 2*acos(0.0)]
	set delta [expr $delta*($pi/180)]
	set index_x [$tl.columns_x.column_x getvalue]
	set index_y [$tl.columns_y.column_y getvalue]
	if {$index_x == "" || $index_y == ""} {
		tk_messageBox -icon error -title "Error"\
		-message "Select X and Y columns"\
		-type ok
		return 0
	}
	set column_x [lindex $exist_columns $index_x]
	set column_y [lindex $exist_columns $index_y]
	set content ""
	set content [read $original_file]
	set content [string map {" " ""} $content]
	set separator [list "$delimiter_in" " "]
	set content [string map $separator $content]
	set content [split $content "\n"]
	set number_string [llength $content]
	for {set i 1} {$i <=$number_string} {incr i} {
		set line [lindex $content [expr $i-1]]
		set X [lindex $line [expr $column_x-1]]
		set Y [lindex $line [expr $column_y-1]]
		if {$X == "" || $Y == ""} {#”словие на проверку пустой строчки
			set content [join $content "\n"]
			set separator [list " " "$delimiter_out"]
			set content [string map $separator $content]
			puts $new_file $content
			close $original_file
			close $new_file
			return 1
		}
		set r_cycl [expr hypot($X,$Y)]
		set alpha [expr atan2($Y,$X)]
		set alpha_delta [expr $alpha$znak$delta]
		set x_decart [expr $r_cycl*cos($alpha_delta)]
		set y_decart [expr $r_cycl*sin($alpha_delta)]
		set line [lreplace $line [expr $column_x-1] [expr $column_x-1] "$x_decart"]
		set line [lreplace $line [expr $column_y-1] [expr $column_y-1] "$y_decart"]
		set content [lreplace $content [expr $i-1] [expr $i-1] "$line"]
	}
	set content [join $content "\n"]
	set separator [list " " "$delimiter_out"]
	set content [string map $separator $content]
	puts $new_file $content
	close $original_file
	close $new_file
}
proc change_type_number {entry_offset} {
	set number_double [split $entry_offset "/*-+"]
	set quantity_offset [llength $number_double]
	set double [expr double([lindex $number_double 0])]
	set length_string [expr [string length [lindex $number_double 0]]]
	set operation [string index $entry_offset $length_string]
	set new_offset [append new_offset $double $operation]
	for {set i 2} {$i <= $quantity_offset} {incr i} {
		set double [expr double([lindex $number_double [expr $i-1]])]
		set length_string [expr [string length [lindex $number_double [expr $i-1]]]+$length_string+1]
		set operation [string index $entry_offset $length_string]
		set new_offset [append new_offset $double $operation]
	}
	return $new_offset
}
proc solve_column {} {
	global file_dir delimiter_in exist_columns tl number_column
	set exist_columns ""
	set original_file [open $file_dir r]
	set line [gets $original_file]
	set line [split $line "$delimiter_in"]
	set number_column [llength $line]
	for {set i 1} {$i <=$number_column} {incr i} {
		lappend exist_columns $i
	}
	$tl.columns_x.column_x configure -values $exist_columns
	$tl.columns_y.column_y configure -values $exist_columns
	close $original_file
}
proc fraction_digit {text entry} {
	global tl
	if {[regexp {[^0-9./*+-]} $text]} {
		$entry configure
		return 0
	} else {
		$entry configure
		return 1
	}
}
proc open_file {} {
	global tl dir file_name file_dir
	set types_file {
		{{Text File}		{.csv .dat .txt}	}
		{{All Files}			*				}
	}
	set file_dir [tk_getOpenFile -initialdir initdir -title "Select File" -filetypes $types_file]
	if {$file_dir != ""} {
		set dir [file dirname $file_dir]
		set file_name [file rootname $file_dir]
		set file_name [file tail $file_name]
		$tl.path_input.entry2 delete 0 end
		$tl.path_input.entry2 insert end $file_dir
		$tl.offset.entry1 configure -state normal
		$tl.columns_x.column_x configure -state normal
		$tl.columns_y.column_y configure -state normal
		$tl.delimiter_input.rb2 configure -state normal
		$tl.delimiter_input.rb3 configure -state normal
		$tl.delimiter_input.rb4 configure -state normal
		$tl.delimiter_output.rb2 configure -state normal
		$tl.delimiter_output.rb3 configure -state normal
		$tl.delimiter_output.rb4 configure -state normal
		$tl.copy_type.rb0 configure -state normal
		$tl.copy_type.rb1 configure -state normal
		$tl.copy_type.rb2 configure -state normal
		solve_column
	}
}
proc help_menu {} {
	global width_monitor width_monitor
	destroy .help
	set help [toplevel .help]
	labelframe $help.description -text "Description:" -labelanchor nw -font 14 -borderwidth 0
	button $help.exit_button -text "Exit" -font 14 -bg white -command "destroy $help"
	text $help.description.lb1 -yscrollcommand "$help.description.ybar set" -wrap word -font 14 -bg white -height 12 -width 35
	scrollbar $help.description.ybar -orient vertical -command "$help.description.lb1 yview"
	
	grid columnconfigure $help {0} -weight 1
	grid rowconfigure $help {0} -weight 1
	
	grid columnconfigure $help.description {0} -weight 1
	grid rowconfigure $help.description {0} -weight 1
	
	grid $help.description -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky news
	grid $help.description.lb1 -column 0 -row 0 -columnspan 1 -rowspan 1 -sticky news
	grid $help.description.ybar -column 1 -row 0 -columnspan 1 -rowspan 1 -sticky news
	grid $help.exit_button -column 0 -row 1 -columnspan 1 -rowspan 1 -sticky news
	
	set text_help "ƒанна€ программе принимает массив, состо€щий минимум из 2 векторов\(колонок\), которые представл€ют из еб€ координаты точек по ос€м X и Y в декартовой системе координат. ѕрограмма при выборе соответствующей настройке может помен€ть разделитель клонок или добавить массив точек на указанный угол вдоль оси Z. –азделителем целой и дробной частей числа должна быть точка. ‘айл не должен содержать шапки или предислови€."
	$help.description.lb1 insert end $text_help
}