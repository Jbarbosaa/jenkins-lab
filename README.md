# 🚀 Full Stack DevOps Lab – Ansible + AWS + Maven + Frontend + SES

Este repositório apresenta um laboratório prático com foco em automação DevOps e integração completa de tecnologias backend e frontend. O projeto realiza o deploy de uma aplicação full stack, conectada a um banco de dados, provisionada via **Ansible**, hospedada na **AWS**, construída com **Maven**, e com envio de notificações por **Amazon SES**.

---

## 🧰 Tecnologias Utilizadas

- 💻 **Ansible** – Automação e provisionamento de infraestrutura
- ☁️ **AWS (EC2, S3, SES)** – Infraestrutura e serviços gerenciados
- 🐬 **MySQL** – Banco de dados relacional
- 🌐 **Frontend (HTML + PHP)** – Exibição dos dados do banco
- ☕ **Java + Maven** – Backend construído com build automatizado
- 📧 **Amazon SES** – Envio de e-mails de status ou alertas
- 🐙 **Jenkins (opcional)** – CI/CD integrado
- 🐳 **Docker + Docker Compose** – Ambientes isolados
- 🔐 **IAM Roles & Policies** – Segurança na AWS

---

## 🔧 Funcionalidades

- 🚀 Provisionamento automatizado com Ansible (EC2 + MySQL + app)
- 🔄 Deploy contínuo com Maven (empacotamento `.jar`)
- 🌐 Frontend exibe dados dinâmicos do banco
- 📤 Integração com AWS SES para envio de e-mails:
  - Status de jobs
  - Alertas de falhas
  - Confirmações de operação
- 💾 Backups automáticos para S3
- (Opcional) Integração com Jenkins para CI/CD end-to-end
