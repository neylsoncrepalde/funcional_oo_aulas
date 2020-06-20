from colaborador import Colaborador
from gerente import Gerente
from diretor import Diretor

func1 = Colaborador('Neylson', 'Analytics')
func1.getNome()
func1.getSetor()
print("")

func2 = Gerente('Sérgio', 'Analytics', 3000)
func2.getNome()
func2.getSetor()
func2.getRenda()
print("")

func3 = Diretor('Marco', 'Analytics', 5000)
func3.getNome()
func3.getSetor()
func3.getRenda()
func3.obterLucro(1000)
func3.getRenda()
