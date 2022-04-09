//Protagonista
object rolando {
	const artefactos = #{}
	const artefactosEncontrados = []
	var property capacidadArtefactos = 2
	var property lugarDeGuardado = castilloDePiedra
	var property poderBase = 5
	const property historia = []
	const property lugaresConquistables = []
	
	method artefactos() = artefactos
	
	method artefactosEncontrados() = artefactosEncontrados
	
	method agarrarArtefacto(_artefacto){
		if (artefactos.size() < capacidadArtefactos){
			artefactos.add(_artefacto)
		}
		historia.add(_artefacto)
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
	
	
	method poder(){
		return self.poderBase() + self.sumatoriaDePoderesArtefactos()
	}
	
	method sumatoriaDePoderesArtefactos(){
		return artefactos.sum({artefacto => artefacto.poder(self)})
	}
	
	method batalla(){
		poderBase += 1
		artefactos.forEach({artefacto => artefacto.usar(self)})
	}	
	
	method poderArtefactoMasPoderosoDeLaCasa() {
		return lugarDeGuardado.poderArtefactoMasPoderosoDeLaCasa(self)
	}
	
	method puedoVencer(enemigo){
		return (self.poder() > enemigo.poder()) //self.puedeConquistar(enemigo)//self.noPuedeConquistar(enemigo)
	}
	
	method puedeConquistar(enemigo){ //Lista que contiene los lugares que Rolando puede conquistar
		lugaresConquistables.add(enemigo.morada())
	}
	
	method esPoderoso(){
		return self.puedoVencer(archibaldo) and self.puedoVencer(caterina) and self.puedoVencer(astra)
	}
	
	/*method noPuedeConquistar(enemigo){
		if (lugaresConquistables.contains(enemigo.morada())){
		
		}
	}*/
	
	//Artefacto Fatal
	
}
//Objetos De Rolando
object espadaDelDestino{
	var nueva = true
	
	method poder(duenio){
		return duenio.poderBase() / if (nueva) {1} else {2}
	}
	
	method usar(duenio){
		
	}
}

object collarDivino{
	var cantidadDeBatallas = 0
	const base = 3
	
	method poder(duenio){
		return base + if (duenio.poderBase()>6) {cantidadDeBatallas} else {0}
	}
	
	method usar(duenio){
		cantidadDeBatallas += 1
	}
	
}

object armaduraDeAceroValyrio{
	
	method poder(duenio){
		return 6
	} 
	
	method usar(duenio){
		//No tiene efecto
	}
	
}

object libroDeHechizos{
	
	var property hechizos = []
	
	method poder(duenio){
		return if (hechizos.isEmpty()) 0 else hechizos.first().poder(duenio)
	}
	
	method usar(duenio){
		//hechizos.remove(hechizos.first())
		hechizos = (hechizos.drop(1))
	}
	
	
}
//Hechizos(Libro)
object bendicion{
	
	method poder(duenio){
		return 4
	}
	
	
}
object invisibilidad{
	
	method poder(duenio) {
		return duenio.poderBase()
	}
		
	
}
object invocacion{
	
	method poder(duenio){
		duenio.poderArtefactoMasPoderosoDeLaCasa()
	}
	
	
}
///LUGARES
object castilloDePiedra{
	
	const property baul = #{}
	
	method guardarArtefactos(_artefacto){
		baul.addAll(_artefacto)
	}
	 
/* 	method poderArtefactoMasPoderosoDeLaCasa(duenio){
		if(baul.isEmpty()){
			return 0
		}
		return self.poderMasPoderoso(duenio).poder(duenio)
	}
	
	method poderMasPoderoso(duenio){
		return baul.max({artefacto => artefacto.poder(duenio)})
	}*/
	
	method poderArtefactoMasPoderosoDeLaCasa(duenio){
		//#{espadaDelDestino,libro,armadura} => [5,7,2]
		return baul.map({artefacto => artefacto.poder(duenio)}).maxIfEmpty({0})
		
	}
}

//Enemigos
object archibaldo{
	var property poder = 16
	var property morada = palacioDeMarmol
	
	
}

object caterina{
	var property poder = 28
	var property morada = fortalezaDeAcero


}

object astra{
	var property poder = 14
	var property morada = torreDeMarfil
	
	
}








