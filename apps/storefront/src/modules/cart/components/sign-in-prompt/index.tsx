import { Button, Heading, Text } from "@modules/common/components/ui"
import LocalizedClientLink from "@modules/common/components/localized-client-link"

const SignInPrompt = () => {
  return (
    <div className="bg-white flex items-center justify-between">
      <div>
        <Heading level="h2" className="txt-xlarge font-extrabold text-slate-900">
          ¿Tienes cuenta de Hogar o Negocio Mayorista?
        </Heading>
        <Text className="txt-medium text-ui-fg-subtle mt-1">
          Inicia sesión para guardar tus direcciones, sedes y pedidos frecuentes.
        </Text>
      </div>
      <div>
        <LocalizedClientLink href="/account">
          <Button variant="secondary" className="h-10 font-bold" data-testid="sign-in-button">
            Iniciar Sesión
          </Button>
        </LocalizedClientLink>
      </div>
    </div>
  )
}

export default SignInPrompt
