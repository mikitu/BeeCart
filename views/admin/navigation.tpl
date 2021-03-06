<ul id="menu" class="page-sidebar-menu">
	{{range $key, $val := .admin_menu.Items}}
	<li class="{{$val.Active}}">
		<a href="{{$val.GetUrl}}">
			<i class="livicon" data-name="{{$val.Icon}}" data-size="{{$val.FontSize}}" data-c="{{$val.Color}}" data-hc="{{$val.HColor}}" data-loop="true"></i>
			<span class="title">{{$val.Title}}</span>
			{{if $val.HasSubmenu}}
			<span class="fa arrow"></span>
			{{end}}
		</a>
		{{if $val.HasSubmenu}}
		<ul class="sub-menu">
			{{range $key1, $val1 := $val.Submenu}}
			<li class="{{$val1.Active}}">
				<a href="{{$val1.GetUrl}}">
					<i class="fa fa-angle-double-right"></i>
					{{$val1.Title}}
					{{if $val1.HasSubmenu}}
					<span class="fa arrow"></span>
					{{end}}
				</a>
				{{if $val1.HasSubmenu}}
				<ul class="sub-menu">
					{{range $key2, $val2 := $val1.Submenu}}
					<li class="{{$val2.Active}}">
						<a href="{{$val2.GetUrl}}">
							<i class="fa fa-angle-double-right"></i>
							{{$val2.Title}}
							{{if $val2.HasSubmenu}}
							<span class="fa arrow"></span>
							{{end}}
						</a>
						{{if $val2.HasSubmenu}}
						<ul class="sub-menu">
							{{range $key3, $val3 := $val2.Submenu}}
							<li class="{{$val3.Active}}">
								<a href="{{$val3.GetUrl}}">
									<i class="fa fa-angle-double-right"></i>
									{{$val3.Title}}
								</a>
							</li>
							{{end}}
						</ul>
						{{end}}
					</li>
					{{end}}
				</ul>
				{{end}}
			</li>
			{{end}}
		</ul>
		{{end}}
	</li>
	{{end}}
</ul>