<?php if (!isset($_SESSION)) {@session_start();}?>
<div class="container">
  <div class="form-inline">
    <h1><img id="imgPagina" src="<?php echo base_url();?>img/abastecimiento.svg">Servicios</h1>
    <br>
    <?php if ($this->session->userdata('nivel')=='cliente'){ ?>
      <a href="<?=base_url();?>index.php/principal/agregarServicios">
      <button type="button" class="btn btn-amarillo">Agregar Servicio</button></a>
    <?php } ?>
  </div>
  <br>

<?php
  if($servicios != FALSE){
    $i=0;
    foreach ($servicios->result() as $row) { 
      $i++;?>
      <div class="panel panel-default">
        <div class="panel-body">
        <form class ="form-row" action="<?=base_url();?>index.php/principal/modificarServicio/<?=$row->id_servicio?>" method="POST">
          <div class="form-group col-md-4">
            <label for="fecha_servicio">Fecha de servicio</label>
            <input class="form-control" type="date" value=<?php echo $row->fecha_servicio;?> id="fecha_servicio" name="fecha_servicio" />
          </div>
          <div class="form-group col-md-4">
            <label for="fecha_fin">Fecha de instalación</label>
            <input class="form-control" type="date" value=<?php echo $row->fecha_instalacion;?> id="fecha_fin" name="fecha_instalacion" />
          </div>
          <div class="form-group col-md-4">
            <label for="fecha_entrega">Fecha de entrega</label>
            <input class="form-control" type="date" value=<?php echo $row->fecha_entrega;?> id="fecha_entrega" name="fecha_entrega" />
          </div>
          <div class="form-group col-md-6">
            <label for="descripcion">Descripción</label>
            <input type="text" class="form-control" value='<?php echo $row->descripcion;?>' id="descripcion" name="descripcion"/>
          </div>
          <div class="form-group col-md-6">
            <label for="hora">Hora</label>
            <input type="time" class="form-control" id="hora"  name="hora" value='<?php echo $row->hora;?>'>
          </div>
          <div class="form-group col-md-6">
            <a href="<?=base_url();?>index.php/principal/eliminarServicio/<?=$row->id_servicio?>">
            <button type="button" class="btn btn-rojo"><span class="glyphicon glyphicon-trash"></span> Eliminar</button> </a>
            <?php if ($this->session->userdata('nivel')=='cliente'){ ?>
              <a href="<?=base_url();?>index.php/principal/detalleServicio/<?=$row->id_servicio?>">
              <button type="button" class="btn btn-azul"><span class="glyphicon glyphicon-plus"></span> Agregar Detalle del Servicio</button> </a>
            <?php } ?>
              <br>
          </div>
          <div class="form-inline col-md-6">
           <label for="servicio<?=$i?>">Ver detalle servicio:</label>
             <select class="form-control" id="servicio<?=$i?>" name="servicio<?=$i?>">
               <option value=""></option>
               <option value="<?=$row->id_servicio?>"><?=$row->id_servicio?></option>
             </select>
             <div class="" name="detalle<?=$i?>" id="detalle<?=$i?>"></div>
          </div>
          <div class="form-group col-md-12">
            <label for="tipo_evento">Tipo de evento</label>
            <input type="text" class="form-control" id="tipo_evento"  name="tipo_evento" value='<?php echo $row->tipo_evento;?>' disabled>
          </div>
          <div class="form-group col-md-12">
           <label for="staffAsig">Staff asignado:</label>
              <input class="form-control" id="staffAsig" type="text" placeholder="<?=$row->id_staff." ". $row->nombre." ".$row->paterno." ".$row->materno?>" disabled>
          </div>
          <?php if ($this->session->userdata('nivel')=='administrador'){ ?>
          <div class="form-group col-md-12">
              <label for="staff">Staff</label>
            <?php
              if($staff != FALSE){ ?>
                <select class="form-control" name ="staff" id="staff" >
                <?php foreach ($staff->result() as $row) { ?>
                    <option value="<?php echo $row->id_staff?>">
                      <?php
                      echo $row->nombre." ".$row->paterno." ".$row->materno; 
                      ?>
                      </option>
                <?php } ?>
                </select>
              <?php } 
            ?> 
          </div>
          <?php } ?>
          <?php if ($this->session->userdata('nivel')=='cliente' || $this->session->userdata('nivel')=='administrador'){ ?>
            <button type="submit" id="editar" name="editar" class="btn btn-verde"><span class="glyphicon glyphicon-refresh"></span> Actualizar</button>
          <?php } ?>
      </form>
     </div>
    </div>
    <?php } 
  }?>
</div>