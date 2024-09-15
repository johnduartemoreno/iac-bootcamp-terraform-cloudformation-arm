
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

- **Proveedor (`provider`):** Especifica el servicio en la nube (ej. AWS, Azure).
- **Recurso (`resource`):** Define los componentes de infraestructura a crear (ej. instancias EC2).
- **Variables (`variable`):** Parámetros que hacen el código reutilizable.
- **Estado (`terraform state`):** Archivo que mantiene el estado actual de la infraestructura.

### **Ejemplo de Proveedor:**

```hcl
provider "aws" {
  region = "us-east-1"
}
```

### **Ejemplo de Recurso:**

```hcl
resource "aws_instance" "mi_instancia" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "MiInstancia"
  }
}
```

### **Bloques Clave Adicionales en Terraform**

- **Variables:** Permiten parametrizar las configuraciones.
  
  ```hcl
  variable "instance_type" {
    description = "Tipo de instancia EC2"
    default     = "t2.micro"
  }
  ```

- **Outputs:** Permiten mostrar información útil, como la IP pública de una instancia.

  ```hcl
  output "ip_publica" {
    description = "IP pública de la instancia"
    value       = aws_instance.mi_instancia.public_ip
  }
  ```

- **Módulos:** Reutilizan configuraciones comunes.

  ```hcl
  module "vpc" {
    source = "./modules/vpc"
    cidr_block = "10.0.0.0/16"
  }
  ```

- **Fuentes de Datos (`data`):** Recuperan información sobre recursos externos.

  ```hcl
  data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"]
  }
  ```

- **Backends y Estado (`terraform`):** Definen el backend donde se almacena el estado.

  ```hcl
  terraform {
    backend "s3" {
      bucket = "mi-bucket-de-terraform"
      key    = "terraform/state"
      region = "us-east-1"
    }
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

### **Ejemplo Básico (YAML):**

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Resources:
  MiInstanciaEC2:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: t2.micro
      ImageId: ami-0c55b159cbfafe1f0
```

---

## Conclusión

Además de `provider`, `resource` y `tags`, Terraform tiene varios otros componentes clave como `variable`, `output`, `locals`, `module`, y `data`, que te permiten construir configuraciones reutilizables y gestionables. AWS CloudFormation y Azure ARM también ofrecen enfoques robustos para la gestión de infraestructura como código, permitiéndote desplegar y gestionar recursos de manera eficiente.

Para más información, visita la [Documentación oficial de Terraform](https://www.terraform.io/docs).
