<%-- 
    Document   : consultaModelos
    Created on : 28/06/2019, 08:56:56
    Author     : vitor
--%>

<%@page import="net.ifts16.enums.Marca"%>
<%@page import="net.ifts16.model.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.html" %>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <br>
            <h1>Modelos</h1>
            <hr>
            <button type="button" class="btn btn-success btn-lg ingresarModelo">
                Ingresar Modelo
            </button>
            <br>
            <br>
            <table class="table table-bordered">
                <input type="hidden" name="tipo" value="listado" />
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Marca</th>
                    <th class="text-center">Descripcion</th>
                    <th class="text-center">Acciones</th>
                </tr>
                <%List<Modelo> modelos = (List<Modelo>)request.getAttribute("modelos");
                    for (Modelo a : modelos) {
                %>
                <tr>
                    <td class="text-center"><%= a.getId()%></td>
                    <td class="text-center"><%= a.getMarca().toString() %></td>
                    <td class="text-center"><%= a.getNombre() %></td>
                    <td class="text-center">
                        <!--<a href="Modelo?comando=editar&id=<%= a.getId()%>" class="btn btn-warning btn-sm">Editar</a>-->
                        <button type="button" class="btn btn-warning btn-sm editar" value="<%= a.getId()%>">
                            Editar
                        </button>
                        <button type="button" class="btn btn-danger btn-sm eliminar" value="<%= a.getId()%>" data-toggle="modal" data-target="#confirmarEliminarModal">
                            Eliminar
                        </button>
                    </td>
                </tr>
                <% } %>
            </table>
        
                                    <!-- Modal Editar Modelo -->
        <div class="modal fade" id="confirmarEditarModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarEditarModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmarEditarModalLabel">Editar Modelo</h5>
                    </div>
                    <div class="modal-body">
                        <h6 class="modal-title">Informacion del modelo</h6>
                        <br>
                        <div class="list-group">
                            <div class="list-group">
                                <li class="list-group-item"><b>ID: </b><span id="id"/></li>
                                <li class="list-group-item"><b>Marca: </b><span id="nombre"/></li>
                                <li class="list-group-item"><b>Descripcion: </b><span id="descripcion"/></li>
                            </div>
                        </div>
                        <br>
                        <h6 class="modal-title">Nueva descripcion</h6>
                        <br>
                        <div class="form-group">
                            <input type="text" class="form-control" id="nueva" name="nueva" aria-describedby="nueva" placeholder="Ingrese la nueva descripcion" required="required">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" editarModelo>Editar</button>
                    </div>
                </div>
            </div>
        </div>
            
                                <!-- Modal Ingresar Modelo -->
        <div class="modal fade" id="ingresarModeloModal" value="" tabindex="-1" role="dialog" aria-labelledby="ingresarModeloModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ingresarModeloModalLabel">Ingresar Modelo</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <select class="form-group custom-select" id="marca" name="marca">
                                <option>Marca</option>
                                <% for(Marca c : Marca.values()){
                                %>    
                                    <% out.print("<option value=" + c.name() + ">" + c.toString() + "</option>"); %>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="descripcionModelo" name="descripcionModelo" aria-describedby="descripcionModelo" placeholder="Ingresar la descripcion" required="required">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="confirmarModelo">Registrar</button>
                    </div>
                </div>
            </div>
        </div>        

            
                        <!-- Modal confirmar eliminar modelo -->
            <div class="modal fade" id="confirmarEliminarModal" value="" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminarModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmarEliminarModalLabel">Eliminar</h5>
                        </div>
                        <div class="modal-body">
                            <p>¿Desea eliminar este modelo?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-danger confirmar">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal reserva confirmada -->
            <div class="modal fade" id="eliminacionConfirmadaModal" tabindex="-1" role="dialog" aria-labelledby="eliminacionConfirmadaModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p>Cambios realizados en el modelo</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="aceptarEliminarButton">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
<script>
    $(document).on("click", ".ingresarModelo", function () {
        $('#ingresarModeloModal').modal('show');
        $('#confirmarModelo').click(function () { 
           let marca = $('#marca').val();
           let descripcion = $('#descripcionModelo').val();
            $.ajax({
                method: "POST",
                url: "Modelo",
                data: {
                comando: "crear",    
                marca: marca,
                descripcion: descripcion
            },
                success: function(){
                $('#aceptarEliminarButton').click(function () {
                        location.reload();
                        });
                $('#ingresarModeloModal').modal('toggle');
                $('#eliminacionConfirmadaModal').modal('toggle');
            }
            });
        });
    });
</script>


<script>
    $(document).on("click", ".eliminar", function () {
        let modeloId = $(this).val();
        $('#confirmarEliminarModal').val(modeloId);
        $(".confirmar").click(function () {
            $.ajax({
                method: "POST",
                url: "Modelo",
                data: {
                comando: 'eliminar',    
                modeloId: modeloId
            }
            })
                .done(function () {
                        $('#aceptarEliminarButton').click(function () {
                            location.reload();
                        });
                        $('#confirmarEliminarModal').modal('toggle');
                        $('#eliminacionConfirmadaModal').modal('toggle');
                });
        });
    });
</script>

<script>
    $(document).on('click', '.editar', function(){
       let modeloId = $(this).val(); 
        $.ajax({
            method: "POST",
            url: "Modelo",
            data: {
                comando: "mostrar",    
                modeloId: modeloId
            },
            success: function(data){
                let datos = JSON.parse(data);
                $('#id').text(datos.id);
                $('#nombre').text(datos.marca);
                $('#descripcion').text(datos.nombre);
                $('#confirmarEditarModal').modal('show');
            }
            });
        
    });
    document.querySelector('[editarModelo]').onclick = function () {
        let id = $('#id').html();
        let descripcion = $('#nueva').val();
            $.ajax({
                method: "POST",
                url: "Modelo",
                data: {
                comando: 'editar',    
                id: id,
                descripcion: descripcion
            }
            })
                    .done(function () {
                    $('#aceptarEliminarButton').click(function () {
                        location.href = 'Modelo';
                    });
                    $('#confirmarEditarModal').modal('toggle');
                    $('#eliminacionConfirmadaModal').modal('toggle');
                });
            };
            
</script>

