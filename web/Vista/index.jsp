<%@ include file="menu.jsp" %>

<div class="tab-content col-9 m-3" id="v-pills-tabContent">
    <div class="d-flex align-items-center p-2 rounded mb-3" style="background-color: rgb(21, 37, 58);">
        <img src="Orva_Viajes_logo.png" class="img-fluid me-3" alt="..." width="100px">
        <h1 class="m-0 text-white">Orva Viajes</h1>
    </div>
    <div class="tab-pane fade show active" id="v-pills-bus" role="tabpanel" aria-labelledby="v-pills-bus-tab">
        <%@ include file="AdministrarBuses.jsp" %>
    </div>
    <div class="tab-pane fade" id="v-pills-chofer" role="tabpanel" aria-labelledby="v-pills-chofer-tab">
        <%@ include file="AdministrarChoferes.jsp" %>
    </div>
    <div class="tab-pane fade" id="v-pills-viaje" role="tabpanel" aria-labelledby="v-pills-viaje-tab">
        <%@ include file="AdministrarViajes.jsp" %>
    </div>
    <div class="tab-pane fade" id="v-pills-cliente" role="tabpanel" aria-labelledby="v-pills-cliente-tab">
        <%@ include file="AdministrarClientes.jsp" %>
    </div>
    <div class="tab-pane fade" id="v-pills-pasaje" role="tabpanel" aria-labelledby="v-pills-pasaje-tab">
        <%@ include file="AdministrarPasajes.jsp" %>
    </div>
</div>

<%@ include file="footer.jsp" %>