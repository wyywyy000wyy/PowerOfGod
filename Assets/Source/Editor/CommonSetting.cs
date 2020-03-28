using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

public class CommonSetting : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

    }

    [MenuItem("GameObject/Toogle active _`")]
    static void ChangeActive()
    {
        GameObject[] objs = Selection.gameObjects;
        foreach (GameObject o in objs)
        {
            o.SetActive(!o.activeSelf);
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
}
