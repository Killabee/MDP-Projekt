﻿using MDP_Projekt.UI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace MDP_Projekt_Test
{
    
    
    /// <summary>
    ///This is a test class for FahrzeugDatenUIFahrzeugDatenUI and is intended
    ///to contain all FahrzeugDatenUIFahrzeugDatenUI Unit Tests
    ///</summary>
    [TestClass()]
    public class FahrzeugDatenUITest
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
        ///A test for NutzerDatenUI Constructor
        ///</summary>
        [TestMethod()]
        public void FahrzeugDatenUIConstructorTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI target = new MDP_Projekt.UI.FahrzeugDatenUI();
            // Assert.Inconclusive("TODO: Implement code to verify target");
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI));
        }

        /// <summary>
        ///A test for InitializeComponent
        ///</summary>
        [TestMethod()]
        public void InitializeComponentTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI target = new MDP_Projekt.UI.FahrzeugDatenUI(); // TODO: Initialize to an appropriate value
            target.InitializeComponent();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for System.Windows.Markup.IComponentConnector.Connect
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void ConnectTest()
        {
            System.Windows.Markup.IComponentConnector target = new MDP_Projekt.UI.NutzerDatenUI(); // TODO: Initialize to an appropriate value
            int connectionId = 0; // TODO: Initialize to an appropriate value
            object target1 = null; // TODO: Initialize to an appropriate value
            target.Connect(connectionId, target1);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for dataGridNutzerDaten_SelectionChanged
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void gridFahrzeugDaten_SelectionChangedTest()
        {
            MDP_Projekt.UI.NutzerDatenUI_Accessor target = new MDP_Projekt.UI.NutzerDatenUI_Accessor(); // TODO: Initialize to an appropriate value
            object sender = null; // TODO: Initialize to an appropriate value
            System.Windows.Controls.SelectionChangedEventArgs e = null; // TODO: Initialize to an appropriate value
            target.dataGridNutzerDaten_SelectionChanged(sender, e);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for getFahrzeugarten
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugartenTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor(); 
            System.Collections.Generic.List<MDP_Projekt.Model.TR_FAHRZEUGART> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.TR_FAHRZEUGART> actual;
            actual = target.getFahrzeugarten();
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);            
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getFahrzeuge
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugeTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor(); 
            System.Collections.Generic.List<MDP_Projekt.Model.T_FAHRZEUG> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.T_FAHRZEUG> actual;
            actual = target.getFahrzeuge();            
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getFahrzeugmarkeCombo
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugmarkeComboTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor(); 
            System.Collections.Generic.List<MDP_Projekt.Model.TZ_FAHRZEUGMARKE> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.TZ_FAHRZEUGMARKE> actual;
            actual = target.getFahrzeugmarkeCombo();
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getFahrzeugtypCombo
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugtypComboTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor();
            System.Collections.Generic.List<MDP_Projekt.Model.TR_FAHRZEUGTYP> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.TR_FAHRZEUGTYP> actual;
            actual = target.getFahrzeugtypCombo();
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getFahrzeugtypCombo
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugnutzerComboTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor();
            System.Collections.Generic.List<MDP_Projekt.Model.T_NUTZER> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.T_NUTZER> actual;
            actual = target.getFahrzeugnutzerCombo();
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for getFahrzeugtypCombo
        ///</summary>
        [TestMethod()]
        [DeploymentItem("MDP-Projekt.exe")]
        public void getFahrzeugnutzerComboTest()
        {
            MDP_Projekt.UI.FahrzeugDatenUI_Accessor target = new MDP_Projekt.UI.FahrzeugDatenUI_Accessor();
            System.Collections.Generic.List<MDP_Projekt.Model.T_NUTZER> expected = null; // TODO: Initialize to an appropriate value
            System.Collections.Generic.List<MDP_Projekt.Model.T_NUTZER> actual;
            actual = target.getFahrzeugnutzerCombo();
            Assert.IsNotNull(actual);
            Assert.IsInstanceOfType(target, typeof(FahrzeugDatenUI_Accessor));
            Assert.IsTrue(actual.Capacity > 0);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
