<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Configuração da página -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Links para os estilos Bootstrap e Font Awesome -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN5P1+2N4qI1i1tI6Ar2RT5I07f6JvRM" crossorigin="anonymous">

        <style>
            .form-outline i {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 10px;
            }

            .btn i {
                margin-right: 8px;
            }

            .bg-successs {
                background-color: #0b1c18;
            }

            .back-to-home {
                position: absolute;
                top: 20px;
                left: 20px;
            }
        </style>
    </head>

    <!-- Barra de navegação de retorno à página inicial -->
    <a href="index.jsp" class="btn back-to-home text-light">
        <img src="imagens/iconEx.png" alt="Ícone" style="width: 68px; height: auto;">
    </a>

    <body style="background-image: url('imagens/wpp.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
        <!-- Seção de registro -->
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <!-- Cartão de registro -->
                        <div class="card shadow-2-strong bg-successs" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center text-light" style="">
                                <h3 class="mb-5">Registrar</h3>
                                <!-- Formulário de registro -->
                                <form action="registro_processar.jsp" method="post" class="row g-3 needs-validation" novalidate>
                                    <!-- Nome Completo -->
                                    <div class="col-md-6">
                                        <label for="name" class="form-label">Nome Completo</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-user"></i> <!-- Ícone do usuário -->
                                            <input type="text" id="name" placeholder="Nome Completo" name="nome" class="form-control form-control-lg" required>
                                            <div class="invalid-feedback">
                                                Por favor, insira seu nome.
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Nome de Usuário -->
                                    <div class="col-md-6">
                                        <label for="nm_usuarioLogin" class="form-label">Nome de Usuário</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-user-circle"></i> <!-- Ícone do círculo de usuário -->
                                            <input type="text" placeholder="Nome de Usuário" name="nm_usuarioLogin" class="form-control form-control-lg" required>
                                            <div class="invalid-feedback">
                                                Por favor, escolha um nome de usuário.
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <label for="nm_guerra" class="form-label">Nome de Guerra</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-shield-alt"></i> <!-- Ícone de escudo alternativo -->
                                            <input type="text" id="nm_guerra" placeholder="Nome de Guerra" name="nm_guerra" class="form-control form-control-lg" required>
                                            <div class="invalid-feedback">
                                                Por favor, insira seu nome de guerra.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="typePasswordX-2" class="form-label">Senha</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-lock"></i> <!-- Ícone de cadeado -->
                                            <input type="password" placeholder="Senha" id="typePasswordX-2" name="senha" class="form-control form-control-lg" required>
                                            <div class="invalid-feedback">
                                                Por favor, insira uma senha.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="cd_idade" class="form-label">Sua Idade</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-birthday-cake"></i> <!-- Ícone de bolo de aniversário -->
                                            <input type="number" id="cd_idade" placeholder="Sua Idade" name="cd_idade" class="form-control form-control-lg" readonly>
                                            <div class="invalid-feedback">
                                                Por favor, insira sua idade.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="dt_dataNascimento" class="form-label">Data de Nascimento</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-calendar-alt"></i> <!-- Ícone de calendário alternativo -->
                                            <input type="date" id="dt_dataNascimento" placeholder="Data de Nascimento" name="dt_dataNascimento" class="form-control form-control-lg" required>
                                            <div class="invalid-feedback">
                                                Por favor, insira sua data de nascimento.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="nm_patente" class="form-label">Escolha a Patente</label>
                                        <div class="form-outline mb-4">
                                            <i class="fas fa-medal"></i> <!-- Ícone de medalha -->
                                            <select id="nm_patente" aria-label="Escolha a Patente" name="nm_patente" class="form-control form-control-lg form-select" required>
                                                <option selected disabled value="">Escolha a patente</option>
                                                <option value="Sentinela">Sentinela</option>
                                                <option value="Comandante">Comandante</option>
                                                <option value="Cabo">Cabo</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Por favor, selecione uma patente.
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                            <label class="form-check-label" for="invalidCheck">
                                                Concordo com os termos e condições
                                            </label>
                                            <div class="invalid-feedback">
                                                Você deve concordar antes de enviar.
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Botão de Registro -->
                                    <div class="col-12">
                                        <button class="btn btn-success  btn-lg btn-block" type="submit">Registrar</button>
                                    </div>
                                    <!-- Link para login -->
                                    <div class="text-center">
                                        <p>Possui conta? <a href="index.jsp" class=" text-success">Logar-se</a></p>

                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Script para validação do formulário usando Bootstrap -->
        <script>
            (() => {
                'use strict'
                // Seleciona todos os formulários com a classe 'needs-validation'
                const forms = document.querySelectorAll('.needs-validation')
                // Adiciona um ouvinte de evento de envio para cada formulário
                Array.from(forms).forEach(form => {
                    form.addEventListener('submit', event => {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        // Adiciona a classe 'was-validated' ao formulário
                        form.classList.add('was-validated')
                    }, false)
                })

                // Função para calcular a idade e definir o limite máximo da data de nascimento
                const dt_dataNascimento = document.getElementById('dt_dataNascimento');
                const today = new Date();
                const maxDate = today.toISOString().split('T')[0];
                dt_dataNascimento.setAttribute('max', maxDate);

                dt_dataNascimento.addEventListener('change', function () {
                    const dob = new Date(this.value);
                    const now = new Date();
                    let age = now.getFullYear() - dob.getFullYear();
                    if (now.getMonth() < dob.getMonth() || (now.getMonth() === dob.getMonth() && now.getDate() < dob.getDate())) {
                        age--;
                    }
                    document.getElementById('cd_idade').value = age;
                });
            })()
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>
