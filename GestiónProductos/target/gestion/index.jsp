<!DOCTYPE html>
<html lang="eS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="text-center">Gestión de Productos</h1>
            </div>
        </div>
        <br>
        <br>
        <br>
        <div class="row">
            <div class="offset-sm-4">
                <form action="gestion/rest/products/servlet" method="post" id="dataForm">
                    <legend class="text-justify">Gestión de Productos</legend>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3" for="action">Acción</label>
                        <div class="col-sm-9">
                            <select class="custom-select" id="action">
                                <option selected>Elija acción</option>
                                <option value="insert">Insertar</option>
                                <option value="update">Actualizar</option>
                                <option value="delete">Borrar</option>
                                <option value="selectAll">Ver tabla completa</option>
                                <option value="getter">Ver dato</option>
                                <option value="lookup">Ver fila</option>
                                <option value="identify">Ver dato específico</option>
                            </select>
                        </div>
                    </div> 
                    <div class="form-group row">
                        <label for="stock" class="col-form-label col-sm-3">Còdigo de Producto</label>
                        <div class="col-sm-9">
                            <input type="number"min="0" id="code" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-form-label col-sm-3">Nombre</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="description" class="col-form-label col-sm-3">Descripción</label>
                        <div class="col-sm-9">
                            <input type="text" id="description" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="stock" class="col-form-label col-sm-3">Cantidad</label>
                        <div class="col-sm-9">
                            <input type="number" min="0" id="stock" class="form-control">
                        </div>
                    </div>
                    <input type="hidden" name="products" id="products">
                    <div class="form-group row">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <button type="reset" class="btn btn-danger offset-sm-6">Resetear</button>
                    </div>    
                </form>
            </div>
        </div>
        <div class="row">
        
            

        </div>
    </div>




     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>