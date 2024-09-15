
# Infraestructura como Código (IaC) usando Terraform, AWS CloudFormation y Azure ARM

---

## Introducción

¡Bienvenidos al bootcamp sobre Infraestructura como Código (IaC)! En esta clase exploraremos cómo IaC ha transformado la forma en que gestionamos y desplegamos infraestructura en la nube. Nos enfocaremos en tres herramientas clave:

- **Terraform**
- **AWS CloudFormation**
- **Azure Resource Manager (ARM)**

### Objetivos de la Clase

- Entender el concepto y los beneficios de IaC.
- Aprender los fundamentos de Terraform, AWS CloudFormation y Azure ARM.
- Desplegar recursos en la nube utilizando estas herramientas.
- Comparar las ventajas y limitaciones de cada herramienta.

---

## **1. ¿Qué es Infraestructura como Código (IaC)?**

### **Definición**

IaC es la práctica de gestionar y aprovisionar infraestructura a través de código legible por humanos, en lugar de configuraciones manuales o herramientas gráficas.

### **Beneficios**

- **Automatización:** Reduce errores humanos y aumenta la eficiencia.
- **Consistencia:** Garantiza que los entornos sean idénticos.
- **Escalabilidad:** Facilita el escalado de infraestructuras complejas.
- **Versionamiento:** Permite rastrear y revertir cambios mediante sistemas de control de versiones.
- **Colaboración:** Mejora la colaboración entre equipos al usar herramientas y procesos comunes.

---

## **2. Introducción a las Herramientas de IaC**

### **Terraform**

- **Descripción:** Herramienta de código abierto de HashiCorp que permite definir y aprovisionar infraestructura en múltiples proveedores de nube.
- **Características Clave:**
  - **Multi-nube:** Soporta AWS, Azure, GCP, y más.
  - **Lenguaje HCL:** Usa HashiCorp Configuration Language, fácil de leer y escribir.
  - **Estado Declarativo:** Mantiene un estado de la infraestructura para aplicar cambios incrementales.

### **AWS CloudFormation**

- **Descripción:** Servicio de AWS que permite modelar y configurar recursos de AWS mediante plantillas en formato JSON o YAML.
- **Características Clave:**
  - **Integración Nativa:** Soporte completo y actualizado para servicios de AWS.
  - **Plantillas Reutilizables:** Facilita la replicación de entornos.
  - **Gestión de Dependencias:** Despliega recursos en el orden correcto.

### **Azure Resource Manager (ARM)**

- **Descripción:** Marco de despliegue para gestionar recursos en Microsoft Azure mediante plantillas JSON.
- **Características Clave:**
  - **Despliegue Declarativo:** Especifica "qué" desplegar, no "cómo".
  - **Agrupación de Recursos:** Organiza recursos en grupos lógicos para una gestión más sencilla.
  - **Políticas y Bloqueos:** Aplica reglas y restricciones a los recursos.


---

## **3. Terraform en Profundidad**

### **Instalación:**

1. Descarga desde [terraform.io](https://www.terraform.io/downloads.html).
2. Añade el ejecutable a tu PATH.

### **Conceptos Básicos:**

- **Proveedor:** Especifica el servicio en la nube (ej. AWS, Azure).
- **Recursos:** Componentes de infraestructura a crear (ej. instancias EC2).
- **Variables:** Parámetros que hacen el código reutilizable.
- **Estado:** Archivo que mantiene el estado actual de la infraestructura.

### **Comandos Principales:**

- `terraform init`: Inicializa el directorio de trabajo.
- `terraform plan`: Muestra los cambios que se aplicarán.
- `terraform apply`: Aplica los cambios para alcanzar el estado deseado.
- `terraform destroy`: Elimina todos los recursos creados.

### **Ejemplo Básico:**

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mi_bucket" {
  bucket = "mi-bucket-ejemplo"
  acl    = "private"
}
```

---

## **4. AWS CloudFormation en Profundidad**

### **Estructura de una Plantilla:**

- **Formato:** JSON o YAML.
- **Secciones Clave:**
  - **Parameters:** Permiten personalizar aspectos de la plantilla.
  - **Resources:** Define los recursos de AWS a crear.
  - **Outputs:** Exporta información después del despliegue.

### **Despliegue de Plantillas:**

- **AWS Management Console:** Interfaz gráfica.
- **AWS CLI:** Línea de comandos.
- **AWS SDKs:** Para lenguajes de programación.

### **Ejemplo Básico (YAML):**

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Resources:
  MiInstanciaEC2:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: t2.micro
      ImageId: ami-0abcdef1234567890
```


---

## **5. Azure Resource Manager (ARM) en Profundidad**

### **Estructura de una Plantilla:**

- **Formato:** JSON.
- **Secciones Clave:**
  - **$schema:** URL del esquema de la plantilla.
  - **contentVersion:** Versión de la plantilla.
  - **parameters:** Parámetros personalizables.
  - **variables:** Valores reutilizables.
  - **resources:** Recursos a desplegar.
  - **outputs:** Valores de salida.

### **Despliegue de Plantillas:**

- **Azure Portal:** Despliegue desde la interfaz web.
- **Azure CLI:** Comandos `az deployment`.
- **Azure PowerShell:** Cmdlets para despliegue.

### **Ejemplo Básico:**

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2019-06-01",
      "name": "[parameters('storageAccountName')]",
      "location": "[resourceGroup().location]",
      "kind": "StorageV2",
      "sku": {
        "name": "Standard_LRS"
      }
    }
  ],
  "parameters": {
    "storageAccountName": {
      "type": "string"
    }
  }
}
```

---

## **6. Comparación entre las Herramientas**

| Característica       | **Terraform**                  | **AWS CloudFormation**         | **Azure ARM**                    |
|----------------------|--------------------------------|--------------------------------|----------------------------------|
| **Alcance**          | Multi-nube                     | Solo AWS                       | Solo Azure                       |
| **Lenguaje**         | HCL                            | JSON/YAML                      | JSON                             |
| **Estado**           | Gestionado por el usuario      | Gestionado por AWS             | Sin estado explícito             |
| **Reutilización**    | Módulos                        | Plantillas y trozos            | Plantillas vinculadas            |
| **Aprendizaje**      | Curva moderada                 | Fácil para usuarios de AWS     | Fácil para usuarios de Azure     |
| **Comunidad**        | Amplia y activa                | Soporte oficial de AWS         | Soporte oficial de Microsoft     |


---

## **7. Mejores Prácticas**

- **Versionamiento de Código:** Utiliza Git u otro sistema de control de versiones.
- **Manejo de Secretos:** Nunca almacenes credenciales en texto plano; usa servicios como AWS Secrets Manager o Azure Key Vault.
- **Validación y Pruebas:** Prueba tus plantillas en entornos de desarrollo antes de producción.
- **Documentación:** Mantén comentarios y documentación actualizada en tus plantillas.
- **Automatización:** Integra IaC en tus pipelines de CI/CD.

---

## **8. Demostración Práctica**

### **Ejercicio con Terraform:**

1. **Objetivo:** Crear una instancia EC2 en AWS.
2. **Pasos:**
   - Configurar las credenciales de AWS.
   - Escribir un archivo `main.tf` con el proveedor y recurso.
   - Ejecutar `terraform init`, `terraform plan` y `terraform apply`.

**Código de Ejemplo:**

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mi_instancia" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

---

## **9. Recursos Adicionales**

- **Documentación Oficial:**
  - Terraform: [terraform.io/docs](https://www.terraform.io/docs)
  - AWS CloudFormation: [docs.aws.amazon.com/cloudformation](https://docs.aws.amazon.com/cloudformation)
  - Azure ARM Templates: [docs.microsoft.com/azure/templates](https://docs.microsoft.com/azure/templates/)
- **Cursos y Tutoriales:**
  - HashiCorp Learn: Tutoriales de Terraform.
  - AWS Workshops: Ejercicios prácticos con CloudFormation.
  - Microsoft Learn: Cursos gratuitos sobre Azure ARM.

---

## **Conclusión**

IaC es una herramienta poderosa que permite gestionar infraestructuras de manera eficiente y reproducible. Al dominar Terraform, AWS CloudFormation y Azure ARM, estarás equipado para trabajar con múltiples proveedores de nube y adoptar las mejores prácticas en tus proyectos.
