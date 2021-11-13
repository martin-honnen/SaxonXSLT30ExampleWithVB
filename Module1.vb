Imports System.IO
Imports Saxon.Api

Module Module1

    Sub Main()
        Dim processor = New Processor()

        Dim xsltCompiler = processor.NewXsltCompiler()

        Dim xsltExecutable As XsltExecutable

        Using fs = File.OpenRead("recursive-grouping.xsl")
            xsltExecutable = xsltCompiler.Compile(fs)
        End Using

        Dim xslt30Processor = xsltExecutable.Load30()

        Using fs = File.OpenRead("input-sample.xml")
            xslt30Processor.Transform(fs, processor.NewSerializer(Console.Out))
        End Using
    End Sub

End Module
