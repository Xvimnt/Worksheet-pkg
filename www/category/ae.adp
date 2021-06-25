<formtemplate id="add_edit">
	<div class="row">
	  <div class="col-md-12">
	    <label for="name">Año:</label> <span class="text-danger">* (requerido)</span>
	    <formwidget id="name" class="form-control" required>    
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-12">
	    <label for="plural">Cuota (Q.):</label> <span class="text-danger">* (requerido)</span>
	    <formwidget id="plural" class="form-control" required>    
	    <formwidget id="profiling_weight" class="d-none" required>    
	  </div>
	</div>
	<hr>
	<div class="row">
	  <div class="col-md-12 text-center">
	    <button class="btn btn-warning" type="submit"><i class="fas fa-save"> Guardar</i></button>
	  </div>
	</div>
</formtemplate>
<script type="text/javascript">
	$(document).ready(function() {
	   $( "#name" ).datepicker({
	   	format: "yyyy",
	    viewMode: "years", 
	    minViewMode: "years",
	   	zIndex: 9999,
	   });
	});
</script>