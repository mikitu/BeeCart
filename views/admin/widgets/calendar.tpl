<div class="col-lg-6 col-md-6 col-sm-6">
	<div class="panel panel-border">
		<div class="panel-heading border-light">
			<h4 class="panel-title">
				<i class="livicon" data-name="calendar" data-size="16" data-loop="true" data-c="#333" data-hc="#333"></i>
				Calendar
			</h4>
                                <span class="pull-right">
                                    <i class="glyphicon glyphicon-chevron-up showhide clickable"></i>
                                    <i class="glyphicon glyphicon-remove removepanel clickable"></i>
                                </span>
		</div>
		<div class="panel-body">
			<div id='external-events'></div>
			<div id="calendar"></div>
			<div class="box-footer pad-5">
				<a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#myModal">Create event</a>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">
								<i class="fa fa-plus"></i>
								Create Event
							</h4>
						</div>
						<div class="modal-body">
							<div class="input-group">
								<input type="text" id="new-event" class="form-control" placeholder="Event">
								<div class="input-group-btn">
									<button type="button" id="color-chooser-btn" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
										Type
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" id="color-chooser">
										<li>
											<a class="palette-primary" href="#">Primary</a>
										</li>
										<li>
											<a class="palette-success" href="#">Success</a>
										</li>
										<li>
											<a class="palette-info" href="#">Info</a>
										</li>
										<li>
											<a class="palette-warning" href="#">warning</a>
										</li>
										<li>
											<a class="palette-danger" href="#">Danger</a>
										</li>
										<li>
											<a class="palette-default" href="#">Default</a>
										</li>

									</ul>
								</div>
								<!-- /btn-group --> </div>
							<!-- /input-group --> </div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger pull-right"  data-dismiss="modal">
								Close
								<i class="fa fa-times"></i>
							</button>
							<button type="button" class="btn btn-success pull-left" id="add-new-event" data-dismiss="modal">
								<i class="fa fa-plus"></i>
								Add
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>