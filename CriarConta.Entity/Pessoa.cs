using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
   public class Pessoa
    {
        public int cvIdPessoa { get; set; }
        public string ccNome { get; set; }
        public string ccEndereco { get; set; }
        public string ccCidade { get; set; }
        public string ccCEP { get; set; }
        public string ccTelefoneCelular { get; set; }
        public string ccTelefoneComercial { get; set; }
        public string ImgComprovResid { get; set; }
        public byte btImgComprovResid { get; set; }
        public string cvIdEstadoCivil { get; set; }
        public string ccTelefoneResidencial { get; set; }
        public string ccUF { get; set; }
        public string ccEmail { get; set; }
        public string ccNascimento { get; set; }
        public DateTime cdNascimento { get; set; }
        public string ccRG { get; set; }
        public string ccCPF { get; set; }
        public char ccRet { get; set; }
        public byte[] ccImage { get; set; }
    }
}
