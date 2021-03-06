﻿using MDP_Projekt.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace MDP_Projekt_Test
{
    
    
    /// <summary>
    ///This is a test class for ContextTest and is intended
    ///to contain all ContextTest Unit Tests
    ///</summary>
    [TestClass()]
    public class ContextTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for Context Constructor
        ///</summary>
        [TestMethod()]
        public void ContextConstructorTest()
        {
            System.Data.EntityClient.EntityConnection connection = null; // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(connection);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for Context Constructor
        ///</summary>
        [TestMethod()]
        public void ContextConstructorTest1()
        {
            string connectionString = string.Empty; // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(connectionString);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for Context Constructor
        ///</summary>
        [TestMethod()]
        public void ContextConstructorTest2()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for AddToTR_FAHRZEUGART
        ///</summary>
        [TestMethod()]
        public void AddToTR_FAHRZEUGARTTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.TR_FAHRZEUGART tR_FAHRZEUGART = null; // TODO: Initialize to an appropriate value
            target.AddToTR_FAHRZEUGART(tR_FAHRZEUGART);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for AddToTR_FAHRZEUGTYP
        ///</summary>
        [TestMethod()]
        public void AddToTR_FAHRZEUGTYPTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.TR_FAHRZEUGTYP tR_FAHRZEUGTYP = null; // TODO: Initialize to an appropriate value
            target.AddToTR_FAHRZEUGTYP(tR_FAHRZEUGTYP);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for AddToTZ_FAHRZEUGMARKE
        ///</summary>
        [TestMethod()]
        public void AddToTZ_FAHRZEUGMARKETest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.TZ_FAHRZEUGMARKE tZ_FAHRZEUGMARKE = null; // TODO: Initialize to an appropriate value
            target.AddToTZ_FAHRZEUGMARKE(tZ_FAHRZEUGMARKE);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for AddToT_FAHRZEUG
        ///</summary>
        [TestMethod()]
        public void AddToT_FAHRZEUGTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.T_FAHRZEUG t_FAHRZEUG = null; // TODO: Initialize to an appropriate value
            target.AddToT_FAHRZEUG(t_FAHRZEUG);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for AddToT_NUTZER
        ///</summary>
        [TestMethod()]
        public void AddToT_NUTZERTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            MDP_Projekt.Model.T_NUTZER t_NUTZER = null; // TODO: Initialize to an appropriate value
            target.AddToT_NUTZER(t_NUTZER);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for TR_FAHRZEUGART
        ///</summary>
        [TestMethod()]
        public void TR_FAHRZEUGARTTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            System.Data.Objects.ObjectSet<MDP_Projekt.Model.TR_FAHRZEUGART> actual;
            actual = target.TR_FAHRZEUGART;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for TR_FAHRZEUGTYP
        ///</summary>
        [TestMethod()]
        public void TR_FAHRZEUGTYPTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            System.Data.Objects.ObjectSet<MDP_Projekt.Model.TR_FAHRZEUGTYP> actual;
            actual = target.TR_FAHRZEUGTYP;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for TZ_FAHRZEUGMARKE
        ///</summary>
        [TestMethod()]
        public void TZ_FAHRZEUGMARKETest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            System.Data.Objects.ObjectSet<MDP_Projekt.Model.TZ_FAHRZEUGMARKE> actual;
            actual = target.TZ_FAHRZEUGMARKE;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for T_FAHRZEUG
        ///</summary>
        [TestMethod()]
        public void T_FAHRZEUGTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            System.Data.Objects.ObjectSet<MDP_Projekt.Model.T_FAHRZEUG> actual;
            actual = target.T_FAHRZEUG;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for T_NUTZER
        ///</summary>
        [TestMethod()]
        public void T_NUTZERTest()
        {
            MDP_Projekt.Model.Context target = new MDP_Projekt.Model.Context(); // TODO: Initialize to an appropriate value
            System.Data.Objects.ObjectSet<MDP_Projekt.Model.T_NUTZER> actual;
            actual = target.T_NUTZER;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
