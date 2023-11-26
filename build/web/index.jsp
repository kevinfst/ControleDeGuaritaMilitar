<!-- links das bibliotecas -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-ZfM5rn5bozg2Wp38R7PuU5h/D3s3pPiR6eHtQj3PDNmw9T9gA1eJrE4zFSxCvo6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- codigo css para aplicação  -->
<style>

    .bg-successs{
        background-color:  #0b1c18;
    }
    .centered-img {
        display: block;
        max-width: 30%; /* Ajuste a largura conforme necessário */
    }
    
</style>

<section class="vh-75" style="background-image: url('imagens/wpp.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong bg-successs text-light" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <img src="imagens/iconEx.png" alt="alt" class="centered-img mb-4 mx-auto">
                        <h3 class="mb-5">Entrar no Sistema</h3>
                        <form action="login_processar.jsp" method="post">
                            <div class="form-outline mb-4">
                                <input type="text" id="typeEmailX-2" placeholder="Nome de Usuario" name="email" class="form-control form-control-lg" />
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" placeholder="Senha" id="typePasswordX-2"  name="senha" class="form-control form-control-lg" />
                            </div>

                            <button class="btn btn-success btn-lg btn-block" type="submit">Login</button>

                        </form>

                        <div class="text-center">
                            <p>Não tem conta? <a href="registro.jsp" class="text-success">Cadastre-se</a></p>
                        </div>

                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        </div>
    </div>
</section>
