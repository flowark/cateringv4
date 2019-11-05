<div class="m-content">
      <div class="m-header container">
        <h1>Agregar servicio</h1>
      </div>

      <div class="m-body panel container">
        <form action="<?php echo base_url();?>index.php/principal/insertaServicio" method="POST" class="formulario panel-body">
            <div class="form-group col-md-6">
              <label for="fecha_servicio">Fecha Servicio</label>
              <input type="date" value="" class="form-control" id="fecha_servicio" 
              name="fecha_servicio" required>
            </div>

            <div class="form-group col-md-6">
              <label for="fecha_instalacion">Fecha Instalacion</label>
              <input type="date" value="" class="form-control" id="fecha_instalacion" 
              name="fecha_instalacion" required>
            </div>

            <div class="form-group col-md-6">
              <label for="fecha_entrega">Fecha Entrega</label>
              <input type="date" value="" class="form-control" id="fecha_entrega" 
              name="fecha_entrega" required>
            </div>

             <div class="form-group col-md-6">
              <label for="hora">Hora</label>
              <input type="time" value="" class="form-control" id="hora" 
              name="hora" required>
            </div>

            <div class="form-group">
              <label for="descripcion">Descripcion</label>
              <input type="text" value="" class="form-control" id="descripcion" 
              name="descripcion" required>
            </div>
            <div class="form-group col-md-6">
              <label for="curp">Curp</label>
              <input type="text" value="" class="form-control" id="curp" 
              name="curp" required>
            </div>
            <div class="form-group col-md-6">
              <label for="tipoEvento">Tipo de evento</label>
              <select class="form-control" name="tipoEvento">
                <option selected value="Social">Social</option>
                <option selected value="Corporativo">Corporativo</option>
                <option selected value="Cultural">Cultural</option>
              </select>
            </div>
              <button type="submit" class="btn btn-azul">Agregar</button>
        </form>
      </div>
    </div>
  </div>