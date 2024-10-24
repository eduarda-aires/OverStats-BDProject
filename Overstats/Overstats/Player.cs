using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

namespace Overstats
{

    [Serializable()]
    public class Player
    {
        private String _id;
        private String _nome;
        private String _email;

        public String Id
        {
            get { return _id; }
            set { _id = value; }
        }


        public String Email
        {
            get { return _email; }
            set
            {
                _email = value;
            }
        }

        public String Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public override String ToString()
        {
            return Id + "   " + Email + "   "+ Nome;
        }

        public Player() : base()
        {
        }

        public Player(String id, String nome, String email) : base()
        {
            this.Id = id;
            this.Nome = nome;
            this.Email = email;
        }

        public Player(String Nome) : base()
        {
            this.Nome = Nome;
        }
    }
}


