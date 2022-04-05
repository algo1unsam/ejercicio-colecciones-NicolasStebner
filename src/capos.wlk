
object rolando {
	const artefactos = #{}
	const artefactosEncontrados = []
	
	var property capacidadArtefactos = 2
	var property lugarDeGuardado = castilloDePiedra
	
	method artefactos() = artefactos
	
	method artefactosEncontrados() = artefactosEncontrados
	
	method agarrarArtefacto(_artefacto){
		if (artefactos.size() < capacidadArtefactos){
			artefactos.add(_artefacto)
		}
	}
	method encontrarArtefacto(_artefacto){
		artefactosEncontrados.add(_artefacto)
		self.agarrarArtefacto(_artefacto)

	}
	method irAlLugarDeGuardado(){
		lugarDeGuardado.guardarArtefactos(artefactos)
		//Esto es equivalente a addAll() en el metodo de castilloDePiedra.guardarArtefactos()
		//artefactos.forEach({ cadaArtefacto => castilloDePiedra.guardarArtefactos(cadaArtefacto)})
		artefactos.clear()
	}
	
	method artefactosEnTotal(){
		return self.artefactos() + lugarDeGuardado.baul()
	}
	
	method poseeEsteArtefacto(_artefacto){
		return artefactos.contains(_artefacto) or lugarDeGuardado.baul().contains(_artefacto)
	}
	
}

object espadaDelDestino{
	
}

object libroDeHechizos{
	
}

object collarDivino{
	
}

object armaduraDeAceroValyrio{
	
}

object castilloDePiedra{
	
	const baul = #{}
	
	method baul() = baul
	
	method guardarArtefactos(_artefacto){
		baul.addAll(_artefacto)
	}
	
}