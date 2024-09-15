
# Ejercicio 1: Desplegar una Instancia EC2 con Terraform

## Objetivo

Aprender a desplegar una instancia EC2 en AWS utilizando Terraform.

## Pasos a Seguir

1. **Configura tus credenciales de AWS** en tu máquina local.

2. **Inicializa el directorio de trabajo**:

   ```bash
   terraform init
   ```

3. **Revisa el plan de ejecución**:

   ```bash
   terraform plan
   ```

4. **Aplica los cambios para crear la instancia**:

   ```bash
   terraform apply
   ```

5. **Verifica la creación** en la consola de AWS.

6. **Destruye los recursos** al finalizar:

   ```bash
   terraform destroy
   ```

## Notas

- Asegúrate de reemplazar el ID de AMI con uno válido en tu región.
- Verifica que tus credenciales de AWS tengan los permisos necesarios.

## Recursos

- [Documentación de Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
