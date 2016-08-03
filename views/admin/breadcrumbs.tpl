<ol class="breadcrumb">

	{{range $val := .Breadcrumbs.Items}}
	{{if $val.IsActive}}
	<li class="active">{{$val.Title}}</li>
	{{else}}
	<li>
		<a href="{{$val.Url}}">
			{{$val.Title}}
		</a>
	</li>
	{{end}}
	{{end}}
</ol>